require "spec_helper"
require "mailing_spec_helper"

describe CampaignsController do

  reset_domain_tables :market_campaigns, :market_segments, :end_users, :market_campaign_messages, :site_versions, :site_nodes, :market_links, :market_campaign_queues, :mail_templates, :market_link_entries

  def create_ready_to_send_campaign
    @user1 = EndUser.push_target('test1@test.dev')
    @user2 = EndUser.push_target('test2@test.dev')
    @campaign = MarketCampaign.create_custom_campaign('campaign', [@user1.id, @user2.id])
    html = '<p>Please visit us at <a href="http://test.dev/">test.dev</a></p>'
    text = 'Please visit us at http://test.dev/'
    @campaign.create_mail_template :name => 'test', :body_type => 'html,text', :subject => 'test subject', :language => 'en', :template_type => 'campaign', :body_html => html, :body_text => text
    @message = MarketCampaignMessage.create :market_campaign_id => @campaign.id
    @campaign.status = 'setup'
    @campaign.save
    @campaign
  end

  def create_members_segment
    @user1 = EndUser.push_target('test1@test.dev')
    @user1.tag('new')
    @user2 = EndUser.push_target('test2@test.dev')
    @user2.tag('new')
    @user_segment = UserSegment.create :name => 'test', :segment_type => 'filtered', :segment_options_text => 'email.like("%@test.dev")'
    @segment = @user_segment.market_segment
  end

  def create_mail_template
    @mail_template = MailTemplate.create :name => 'Test Template', :subject => 'Test Subject', :language => 'en', :template_type => 'campaign', :body_text => 'Test email body', :body_type => 'text'
  end

  def fake_net_http(response)
    @http = mock
    @http.should_receive(:read_timeout=).any_number_of_times
    @http.should_receive(:request_head).and_yield(response)
    Net::HTTP.should_receive(:start).and_yield(@http)
  end

  it "should require the mail module to be setup" do
    mock_editor
    get 'index'
    response.should redirect_to(:action => 'missing_mail_module')
  end

  it "should render the missing mail module page" do
    mock_editor
    get 'missing_mail_module'
    response.should render_template('missing_mail_module')
  end

  it "should setup the mail module" do
    mock_editor
    post 'missing_mail_module'
    response.should redirect_to(:action => 'index')
    @mail_node = SiteVersion.default.site_nodes.find_by_module_name_and_node_type('/mailing/mail','M')
    @mail_node.should_not be_nil
    @mail_node.title.should == 'mail'
    @mail_node.node_path.should == '/mail'
  end

  it "should require reply to and company address to be set" do
    @mm = SiteVersion.default.root.add_subpage 'test', 'M'
    @mm.module_name = '/mailing/mail'
    @mm.save.should be_true

    @config = Configuration.retrieve(:options)
    @config.options[:company_address] = ''
    @config.save

    mock_editor
    get 'index'
    response.should redirect_to(:action => 'mail_module_setup')
  end

  it "should set reply to and company address" do
    @mm = SiteVersion.default.root.add_subpage 'test', 'M'
    @mm.module_name = '/mailing/mail'
    @mm.save.should be_true

    mock_editor
    post 'mail_module_setup', :options => {:mailing_contact_email => 'test@test.dev', :company_address => '1 test lane'}
    response.should redirect_to(:action => 'index')
  end

  it "should render the index page if mail module is setup" do
    @mm = SiteVersion.default.root.add_subpage 'test', 'M'
    @mm.module_name = '/mailing/mail'
    @mm.save.should be_true

    @config = Configuration.retrieve(:options)
    @config.options[:mailing_contact_email] = 'test@test.dev'
    @config.options[:company_address] = '1 test lane'
    @config.save

    mock_editor
    get 'index'
    response.should render_template('index')
  end

  describe "editor tests" do
    before(:each) do
      @mm = SiteVersion.default.root.add_subpage 'test', 'M'
      @mm.module_name = '/mailing/mail'
      @mm.save.should be_true

      @config = Configuration.retrieve(:options)
      @config.options[:mailing_contact_email] = 'test@test.dev'
      @config.options[:company_address] = '1 test lane'
      @config.save

      mock_editor
    end

    describe "active table campaigns tests" do
      before(:each) do
	@campaign = create_ready_to_send_campaign
      end

      it "should handle campaign list" do 
	# Test all the permutations of an active table
	controller.should handle_active_table(:campaign_table) do |args|
	  post 'display_campaign_table', args
	end
      end

      it "should be able to delete a campaign" do
	assert_difference 'MarketCampaign.count', -1 do
	  post 'display_campaign_table', :table_action => 'delete', :campaign => {@campaign.id.to_s => @campaign.id}
	end
      end

      it "should be able to copy a campaign" do
	assert_difference 'MarketCampaign.count', 1 do
	  post 'display_campaign_table', :table_action => 'copy', :campaign => {@campaign.id.to_s => @campaign.id}
	end
      end

      it "should be able to archive a campaign" do
	@campaign.archived.should be_false
	assert_difference 'MarketCampaign.count', 0 do
	  post 'display_campaign_table', :table_action => 'archive', :campaign => {@campaign.id.to_s => @campaign.id}
	end
	@campaign.reload
	@campaign.archived.should be_true
      end
    end

    it "should be able to update campaign" do
      @campaign = create_ready_to_send_campaign
      post 'update_campaigns', :cid => [@campaign.id]
      response.should render_template('update_campaigns')
    end

    it "should render the campaign page" do
      get 'campaign'
      response.should render_template('campaign')
    end

    it "should be able to create a campaign" do
      @segment = create_members_segment
      assert_difference 'MarketCampaign.count', 1 do
	post 'campaign', :campaign => {:name => 'Test Campaign', :market_segment_id => @segment.id}, :segment => {:segment_type => 'user_segment'}
      end

      @campaign = MarketCampaign.find(:last)
      @campaign.name.should == 'Test Campaign'
      @campaign.market_segment_id.should == @segment.id
      @campaign.data_model.should == 'user_segment'
      @campaign.status.should == 'created'

      response.should redirect_to(:action => 'message', :path => [@campaign.id])
    end

    it "should not be able to create a campaign without segment" do
      assert_difference 'MarketCampaign.count', 0 do
	post 'campaign', :campaign => {:name => 'Test Campaign', :market_segment_id => nil}, :segment => {:segment_type => 'user_segment'}
      end
      response.should render_template('campaign')
    end

    it "should not be able to create a campaign with a segment that has no entries" do
      @segment = MarketSegment.create :name => 'test', :segment_type => 'user_segment', :options => {:conditions => 'id = -1'}
      assert_difference 'MarketCampaign.count', 0 do
	post 'campaign', :campaign => {:name => 'Test Campaign', :market_segment_id => @segment.id}, :segment => {:segment_type => 'user_segment'}
      end
      response.should render_template('campaign')
    end

    it "should be able to create a campaign and set advanced options" do
      @segment = create_members_segment
      assert_difference 'MarketCampaign.count', 1 do
	post 'campaign', :campaign => {:name => 'Test Campaign', :market_segment_id => @segment.id, :from => 'custom', :from_name => 'No Reply', :from_email => 'noone', :reply_to_name => 'Replier', :reply_to_email => 'support'}, :segment => {:segment_type => 'user_segment'}
      end

      @campaign = MarketCampaign.find(:last)
      @campaign.name.should == 'Test Campaign'
      @campaign.market_segment_id.should == @segment.id
      @campaign.data_model.should == 'user_segment'
      @campaign.status.should == 'created'
      @campaign.from.should == 'custom'
      @campaign.from_name.should == 'No Reply'
      @campaign.from_email.should == 'noone'
      @campaign.reply_to_name.should == 'Replier'
      @campaign.reply_to_email.should == 'support'

      response.should redirect_to(:action => 'message', :path => [@campaign.id])
    end

    it "should be able to edit a campaign" do
      @campaign = create_ready_to_send_campaign

      assert_difference 'MarketCampaign.count', 0 do
	post 'campaign', :path => [@campaign.id], :campaign => {:name => 'New Test Campaign'}
      end

      @campaign.reload
      @campaign.name.should == 'New Test Campaign'

      response.should redirect_to(:action => 'message', :path => [@campaign.id])
    end

    it "should be able to render advanced options" do
      get 'advanced_options'
      response.should render_template('_advanced_options')
    end

    it "should be able to render segments" do
      get 'segments'
      response.should render_template('_segments')
    end

    it "should render segment" do
      get 'segment'
      response.should render_template('_segment')
    end

    it "should create a new segment" do
      assert_difference 'MarketSegment.count', 1 do
	post 'segment', :segment => {:name => 'New Segment', :options => {:content_model_id => 1, :email_field => 'email'}}
      end
      response.should render_template('segment')

      @market_segment = MarketSegment.find(:last)
      @market_segment.name.should == 'New Segment'
      @market_segment.segment_type.should == 'content_model'
    end

    it "should edit a segment" do
      @segment = MarketSegment.create :name => 'Change Me', :segment_type => 'content_model', :options => {:content_model_id => 1, :email_field => 'email'}
      @segment.id.should_not be_nil

      assert_difference 'MarketSegment.count', 0 do
	post 'segment', :segment_id => @segment.id, :segment => {:name => 'New Segment'}
      end
      response.should render_template('segment')

      @segment.reload
      @segment.name.should == 'New Segment'
      @segment.segment_type.should == 'content_model'
    end

    it "should edit a segment" do
      @segment = MarketSegment.create :name => 'Change Me', :segment_type => 'content_model', :options => {:content_model_id => 1, :email_field => 'email'}
      @segment.id.should_not be_nil

      assert_difference 'MarketSegment.count', 0 do
	post 'segment', :segment_id => @segment.id, :segment => {:name => 'New Segment', :options => {:content_model_id => 2, :email_field => 'email_to'}}
      end
      response.should render_template('segment')

      @segment.reload
      @segment.name.should == 'New Segment'
      @segment.segment_type.should == 'content_model'
      @segment.options[:content_model_id].should == 2
      @segment.options[:email_field].should == 'email_to'
    end

    it "should create a new segment for campaign" do
      @campaign = create_ready_to_send_campaign
      assert_difference 'MarketSegment.count', 1 do
	post 'segment', :path => [@campaign.id], :segment => {:name => 'New Segment', :options => {:content_model_id => 1, :email_field => 'email'}}
      end
      response.should render_template('segment')

      @market_segment = MarketSegment.find(:last)
      @market_segment.name.should == 'New Segment'
      @market_segment.segment_type.should == 'content_model'
      @market_segment.market_campaign_id.should == @campaign.id
    end

    it "should render segment_info" do
      @campaign = create_ready_to_send_campaign
      post 'segment_info', :segment_id => @campaign.market_segment.id
      response.should render_template('segment_info')
    end

    it "should render segment_view_list" do
      @segment = create_members_segment
      post 'segment_view_list', :path => [@segment.id]
      response.should render_template('segment_target_list')
    end

    it "should render segment_view_list for custom segment" do
      @campaign = create_ready_to_send_campaign
      post 'segment_view_list', :path => [@campaign.market_segment.id]
      response.should render_template('segment_target_list')
    end

    it "should redirect user if campaign is not under_construction?" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'active'
      @campaign.save

      get 'campaign', :path => [@campaign.id]
      response.should redirect_to(:action => 'campaign_status', :path => [@campaign.id])
    end

    it "should redirect user if campaign is not under_construction?" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'active'
      @campaign.save

      get 'message', :path => [@campaign.id]
      response.should redirect_to(:action => 'campaign_status', :path => [@campaign.id])
    end

    it "should redirect user if campaign is not under_construction?" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'active'
      @campaign.save

      get 'confirm', :path => [@campaign.id]
      response.should redirect_to(:action => 'campaign_status', :path => [@campaign.id])
    end

    it "should redirect user if campaign is not under_construction?" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'active'
      @campaign.save

      get 'verify', :path => [@campaign.id]
      response.should redirect_to(:action => 'campaign_status', :path => [@campaign.id])
    end

    it "should render the message page" do
      @user1 = EndUser.push_target('test1@test.dev')
      @user2 = EndUser.push_target('test2@test.dev')
      @campaign = MarketCampaign.create_custom_campaign('campaign', [@user1.id, @user2.id])
      get 'message', :path => [@campaign.id]
      response.should render_template('message')
    end

    it "should redirect_to campaign if campaign missing segments" do
      @campaign = MarketCampaign.create(:name => 'campaign', :campaign_type => 'email')
      get 'message', :path => [@campaign.id]
      response.should redirect_to(:action => 'campaign', :path => [@campaign.id])
    end

    it "should be able to select a mail_template and set fields" do
      @user1 = EndUser.push_target('test1@test.dev')
      @user2 = EndUser.push_target('test2@test.dev')
      @campaign = MarketCampaign.create_custom_campaign('campaign', [@user1.id, @user2.id])
      @mail_template = create_mail_template

      values = {0 => 'email', 1 => 'name'}
      post 'message', :path => [@campaign.id], :message => @mail_template.id, :values => values, :fields => {0 => 'test'}
      response.should redirect_to(:action => 'confirm', :path => [@campaign.id])

      @campaign.reload
      @campaign.market_campaign_message.fields['test'].should == 'email'
      @campaign.status.should == 'setup'
    end

    it "should be able to duplicate a mail_template" do
      @user1 = EndUser.push_target('test1@test.dev')
      @user2 = EndUser.push_target('test2@test.dev')
      @campaign = MarketCampaign.create_custom_campaign('campaign', [@user1.id, @user2.id])
      @mail_template = create_mail_template

      assert_difference 'MailTemplate.count', 1 do
	post 'message', :path => [@campaign.id], :message => @mail_template.id, :edit => 'duplicate'
      end

      @campaign.reload
      @campaign.status.should == 'created'
      @campaign.mail_template_id.should_not be_nil
      @campaign.mail_template_id.should_not == @mail_template.id

      response.should redirect_to(:controller => :mail_manager, :action => :edit_template, :path => [@campaign.mail_template_id], :return => CampaignsController.to_s.underscore, :return_id => @campaign.id)
    end

    it "should be able to modify a mail_template" do
      @user1 = EndUser.push_target('test1@test.dev')
      @user2 = EndUser.push_target('test2@test.dev')
      @campaign = MarketCampaign.create_custom_campaign('campaign', [@user1.id, @user2.id])
      @mail_template = create_mail_template

      assert_difference 'MailTemplate.count', 0 do
	post 'message', :path => [@campaign.id], :message => @mail_template.id, :edit => 'modify'
      end

      @campaign.reload
      @campaign.status.should == 'created'
      @campaign.mail_template_id.should_not be_nil
      @campaign.mail_template_id.should == @mail_template.id

      response.should redirect_to(:controller => :mail_manager, :action => :edit_template, :path => [@campaign.mail_template_id], :return => CampaignsController.to_s.underscore, :return_id => @campaign.id)
    end

    it "should validate link" do
      @res = Net::HTTPSuccess.new 2, 200, 'OK'
      fake_net_http(@res)
      post 'validate_link', :href => 'http://www.test.dev/'
      response.status.should == 200
    end

    it "should validate link" do
      @res = Net::HTTPRedirection.new 3, 301, 'Redirect'
      fake_net_http(@res)
      post 'validate_link', :href => 'http://www.test.dev/'
      response.status.should == 200
    end

    it "should invalidate link" do
      @res = Net::HTTPClientError.new 4, 404, 'Not Found'
      fake_net_http(@res)
      post 'validate_link', :href => 'http://www.test.dev/'
      response.status.should == 404
    end

    it "should be able to preview template" do
      @user1 = EndUser.push_target('test1@test.dev')
      @user2 = EndUser.push_target('test2@test.dev')
      @campaign = MarketCampaign.create_custom_campaign('campaign', [@user1.id, @user2.id])
      @message = MarketCampaignMessage.create :market_campaign_id => @campaign.id
      @mail_template = create_mail_template

      get 'preview_template', :path => [@campaign.id, @mail_template.id]
      response.should render_template('preview_template')
    end

    it "should be able to delete a template" do
      @mail_template = create_mail_template
      assert_difference 'MailTemplate.count', -1 do
	post 'delete_template', :template_id => @mail_template.id
      end
      MailTemplate.find_by_id(@mail_template.id).should be_nil
    end

    it "should render the confirm page" do
      @campaign = create_ready_to_send_campaign
      get 'confirm', :path => [@campaign.id]
      response.should render_template('confirm')
    end

    it "should redirect to campaign if missing segments" do
      @campaign = create_ready_to_send_campaign
      @campaign.market_segment_id = nil
      @campaign.save
      get 'confirm', :path => [@campaign.id]
      response.should redirect_to(:action => 'campaign', :path => [@campaign.id])
    end

    it "should redirect to message if missing mail template" do
      @user1 = EndUser.push_target('test1@test.dev')
      @user2 = EndUser.push_target('test2@test.dev')
      @campaign = MarketCampaign.create_custom_campaign('campaign', [@user1.id, @user2.id])
      @message = MarketCampaignMessage.create :market_campaign_id => @campaign.id

      get 'confirm', :path => [@campaign.id]
      response.should redirect_to(:action => 'message', :path => [@campaign.id])
    end

    it "should redirect to campaign if missing segments" do
      @campaign = create_ready_to_send_campaign
      @campaign.market_segment_id = nil
      @campaign.save
      get 'verify', :path => [@campaign.id]
      response.body.should include("/website/campaigns/campaign/#{@campaign.id}")
    end

    it "should redirect to message if missing mail template" do
      @user1 = EndUser.push_target('test1@test.dev')
      @user2 = EndUser.push_target('test2@test.dev')
      @campaign = MarketCampaign.create_custom_campaign('campaign', [@user1.id, @user2.id])
      @message = MarketCampaignMessage.create :market_campaign_id => @campaign.id

      get 'verify', :path => [@campaign.id]
      response.body.should include("/website/campaigns/message/#{@campaign.id}")
    end

    it "should render the verify page" do
      @campaign = create_ready_to_send_campaign
      get 'verify', :path => [@campaign.id]
      response.should render_template('_verify')
    end

    it "should not run the campaign" do
      @campaign = create_ready_to_send_campaign
      post 'verify', :path => [@campaign.id]
      response.should render_template('_verify')
      @campaign.reload
      @campaign.status.should == 'setup'
    end

    it "should run the campaign" do
      DomainModelWorker.should_receive(:async_do_work)
      @campaign = create_ready_to_send_campaign
      post 'verify', :path => [@campaign.id], :send_campaign => 1
      @campaign.reload
      @campaign.status.should == 'initializing'
    end

    it "should be able to send sample" do
      @campaign = create_ready_to_send_campaign
      post 'send_sample', :path => [@campaign.id]
    end

    it "should render the target_list page" do
      @campaign = create_ready_to_send_campaign
      get 'target_list', :path => [@campaign.id]
      response.should render_template('target_list')
    end

    it "should redirect_to status if campaign is active" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'active'
      @campaign.save
      get 'target_list', :path => [@campaign.id]
      response.should redirect_to(:action => 'campaign_status', :path => [@campaign.id])
    end

    it "should render update_content_model_options page" do
      @fields = mock_model ContentModelField, :name => 'Email', :field => 'email'
      @content_model = mock_model ContentModel, :content_model_fields => [@fields]
      ContentModel.should_receive(:find_by_id).with('1').and_return(@content_model)
      get 'update_content_model_options', :content_model_id => '1'
      response.should render_template('_segment_edit_content_model_detail')
    end

    it "should render the status page" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'active'
      @campaign.save
      get 'campaign_status', :path => [@campaign.id]
      response.should render_template('campaign_status')
    end

    it "should redirect if campaign is under_construction?" do
      @campaign = create_ready_to_send_campaign
      get 'campaign_status', :path => [@campaign.id]
      response.should redirect_to(:action => 'campaign', :path => [@campaign.id])
    end

    it "should update_stats" do
      DomainModelWorker.should_receive(:async_do_work)
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'active'
      @campaign.save
      get 'update_stats', :path => [@campaign.id]
    end

    it "should update_stats_status" do
      session[:mailing] = {:worker_key => 'test'}
      DomainModel.should_receive(:worker_results).and_return({:processed => true})
      get 'update_stats_status'
    end

    it "should update_stats_status" do
      session[:mailing] = {:worker_key => 'test'}
      DomainModel.should_receive(:worker_results).and_return({:processed => false})
      get 'update_stats_status'
    end

    it "should update_stats_status" do
      session[:mailing] = {:worker_key => 'test'}
      DomainModel.should_receive(:worker_results).and_return(nil)
      get 'update_stats_status'
    end

    it "should render details" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'initializing'
      @campaign.send_campaign
      get 'details', :path => [@campaign.id]
      response.should render_template('_details')
    end

    it "should render details" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'initializing'
      @campaign.send_campaign
      get 'details', :path => [@campaign.id], :detail_type => 'unsubscribed'
      response.should render_template('_details')
    end

    it "should render details" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'initializing'
      @campaign.send_campaign
      get 'details', :path => [@campaign.id], :detail_type => 'opened'
      response.should render_template('_details')
    end

    it "should render details" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'initializing'
      @campaign.send_campaign
      get 'details', :path => [@campaign.id], :detail_type => 'bounced'
      response.should render_template('_details')
    end

    it "should render details" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'initializing'
      @campaign.send_campaign
      get 'details', :path => [@campaign.id], :detail_type => 'clicked'
      response.should render_template('_details')
    end

    it "should render details and download" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'initializing'
      @campaign.send_campaign
      get 'details', :path => [@campaign.id], :download => 1
      response.content_type.should == 'text/csv'
    end

    it "should render details and download" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'initializing'
      @campaign.send_campaign
      get 'details', :path => [@campaign.id], :download => 1, :detail_type => 'opened'
      response.content_type.should == 'text/csv'
    end

    it "should render details and download" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'initializing'
      @campaign.send_campaign
      get 'details', :path => [@campaign.id], :download => 1, :detail_type => 'clicked'
      response.content_type.should == 'text/csv'
    end

    it "should render details and download" do
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'initializing'
      @campaign.send_campaign
      get 'details', :path => [@campaign.id], :download => 1, :detail_type => 'bounced'
      response.content_type.should == 'text/csv'
    end
  end

  it "should handle saving a template to a campaign" do
    @campaign = create_ready_to_send_campaign
    @mail_template = create_mail_template
    controller.params[:return] = CampaignsController.to_s.underscore
    controller.params[:return_id] = @campaign.id
    CampaignsController.mail_template_save(@mail_template, controller)
    @campaign.reload
    @campaign.mail_template_id.should == @mail_template.id
  end

  it "should handle not saving a template to a campaign" do
    @campaign = create_ready_to_send_campaign
    @campaign.status = 'active'
    @campaign.save
    @mail_template = create_mail_template
    controller.params[:return] = CampaignsController.to_s.underscore
    controller.params[:return_id] = @campaign.id
    CampaignsController.mail_template_save(@mail_template, controller)
    @campaign.reload
    @campaign.mail_template_id.should_not == @mail_template.id
  end

  it "should handle mail template cms path" do
    CampaignsController.mail_template_cms_path(controller)
  end

  it "should handle mail template info" do
    CampaignsController.mail_template_edit_handler_info
  end

  describe "user tests" do
    before(:each) do
      @mm = SiteVersion.default.root.add_subpage 'test', 'M'
      @mm.module_name = '/mailing/mail'
      @mm.save.should be_true
      @config = Configuration.retrieve(:options)
      @config.options[:mailing_contact_email] = 'test@test.dev'
      @config.options[:company_address] = '1 test lane'
      @config.save
      @campaign = create_ready_to_send_campaign
      @campaign.status = 'initializing'
      @campaign.send_campaign
      @queue = @campaign.market_campaign_queues.find_by_email(@user1.email)
      @link = @campaign.market_links.create :link_to => 'http://www.test.dev/', :link_hash => 'FFFF'
    end

    it "should be able to view a sent mail template" do
      get 'view', :campaign_hash => @campaign.identifier_hash, :queue_hash => @queue.queue_hash
      @queue.reload
      @queue.opened.should be_true
    end

    it "should be able track campaign links" do
      @queue.opened = true
      @queue.save
      @link.clicked.should == 0

      expect {
	get 'link', :campaign_hash => @campaign.identifier_hash, :queue_hash => @queue.queue_hash, :link_hash => @link.link_hash
      }.to change{ MarketLinkEntry.count }

      @link.reload
      @link.clicked.should == 1
    end

    it "should be able to track open message through image" do
      get 'image', :campaign_hash => @campaign.identifier_hash, :queue_hash => @queue.queue_hash
      @queue.reload
      @queue.opened.should be_true
    end

  end
end
