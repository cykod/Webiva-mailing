require  File.expand_path(File.dirname(__FILE__)) + "/../../../../../spec/spec_helper"

describe MarketCampaign do

  reset_domain_tables :market_campaigns, :market_segments, :end_users, :market_campaign_messages, :site_versions, :site_nodes, :market_links, :market_campaign_queues, :mail_templates

  it "should require unique name and type" do
    @campaign = MarketCampaign.new
    @campaign.valid?
    @campaign.should have(1).errors_on(:name)
    @campaign.should have(1).errors_on(:campaign_type)

    @campaign = MarketCampaign.create :name => 'test', :campaign_type => 'email'
    @campaign.id.should_not be_nil
    @campaign.identifier_hash.should_not be_nil

    @campaign = MarketCampaign.create :name => 'test', :campaign_type => 'email'
    @campaign.id.should be_nil
    @campaign.should have(1).errors_on(:name)
    @campaign.should have(0).errors_on(:campaign_type)
  end

  it "should be able to create a custom campaign of specific users" do
    user1 = EndUser.push_target('test1@test.dev')
    user2 = EndUser.push_target('test2@test.dev')
    @campaign = MarketCampaign.create_custom_campaign('test', [user1.id, user2.id])
    @campaign.should_not be_nil
    @campaign.id.should_not be_nil
    @campaign.name.should == 'test'
    @campaign.campaign_type.should == 'email'
    @campaign.data_model.should == 'members'
    @campaign.market_segment.should_not be_nil
    @campaign.market_segment.options[:user_ids].should == [user1.id, user2.id]
    @campaign.market_segment.segment_type.should == 'custom'
    @campaign.market_segment.name.should == 'test Custom Segment'
    @campaign.market_segment.market_campaign_id.should == @campaign.id
  end

  it "should use the webiva sender by default" do
    @campaign = MarketCampaign.new
    @sender = @campaign.sender_class
    @sender.instance_of?(Mailing::WebivaSender).should be_true
  end

  it "should return the mail module path" do
    mm = SiteVersion.default.root.add_subpage 'test', 'M'
    mm.module_name = '/mailing/mail'
    mm.save.should be_true
    @campaign = MarketCampaign.create :name => 'test', :campaign_type => 'email'
    @campaign.id.should_not be_nil
    @message = MarketCampaignMessage.create :market_campaign_id => @campaign.id
    @message.id.should_not be_nil
    @message.get_mail_module_path.should include('/test')
    @campaign.get_mail_module_path.should include('/test')
  end

  it "should set delivery variables" do
    Configuration.options.mailing_contact_email = 'test@test.dev'
    Configuration.options.mailing_default_from_name = 'Testing'
    vars = {}
    @campaign = MarketCampaign.new
    @campaign.add_delivery_variables(vars)
    vars['system:from'].should == 'Testing <test@test.dev>'
    vars['system:from_name'].should == 'Testing'

    vars = {}
    @campaign = MarketCampaign.new :from => 'custom', :from_email => 'campaign'
    @campaign.add_delivery_variables(vars)
    vars['system:from'].should include('campaign@')
    vars['system:from_name'].should == 'Testing'

    vars = {}
    @campaign = MarketCampaign.new :from => 'custom', :from_email => 'campaign', :from_name => 'Campaign'
    @campaign.add_delivery_variables(vars)
    vars['system:from'].should include('Campaign <campaign@')
    vars['system:from_name'].should == 'Campaign'

    vars = {}
    @campaign = MarketCampaign.new :reply_to_name => 'Reply'
    @campaign.add_delivery_variables(vars)
    vars['system:reply_to'].should be_nil

    vars = {}
    @campaign = MarketCampaign.new :reply_to_name => 'Reply', :reply_to_email => 'reply'
    @campaign.add_delivery_variables(vars)
    vars['system:reply_to'].should include('Reply <reply@')

    vars = {}
    @campaign = MarketCampaign.new :reply_to_email => 'reply'
    @campaign.add_delivery_variables(vars)
    vars['system:reply_to'].should include('reply@')
  end

  it "should generate market links" do
    @campaign = MarketCampaign.create :name => 'test', :campaign_type => 'email'
    @campaign.id.should_not be_nil
    links = ['http://test.dev/', 'http://test.dev/about-us']

    assert_difference 'MarketLink.count', 2 do
      variables = @campaign.generate_market_links(links)
      variables[0][0].should == 'track:http://test.dev/'
      variables[1][0].should == 'track:http://test.dev/about-us'
    end

    assert_difference 'MarketLink.count', 0 do
      variables = @campaign.generate_market_links(links)
      variables[0][0].should == 'track:http://test.dev/'
      variables[1][0].should == 'track:http://test.dev/about-us'
    end
  end

  it "should generate market links and add tracking" do
    @campaign = MarketCampaign.create :name => 'test', :campaign_type => 'email'
    @campaign.id.should_not be_nil
    links = ['http://test.dev/', 'http://test.dev/about-us']

    tracking_variables = []
    assert_difference 'MarketLink.count', 2 do
      tracking_variables = @campaign.generate_market_links(links)
    end

    vars = @campaign.add_tracking_links(tracking_variables, 'TESTHASH')
    vars['track:http://test.dev/'].should include('TESTHASH')
    vars['track:http://test.dev/about-us'].should include('TESTHASH')
  end

  describe "testing with mail module" do
    before(:each) do
      @mm = SiteVersion.default.root.add_subpage 'test', 'M'
      @mm.module_name = '/mailing/mail'
      @mm.save.should be_true

      @campaign = MarketCampaign.create :name => 'test', :campaign_type => 'email'
      @message = MarketCampaignMessage.create :market_campaign_id => @campaign.id
    end

    it "should be able to prepare a mail template" do
      html = <<-HTML
      <p>Please visit us at <a href="http://test.dev/">test.dev</a></p>
      HTML

      text = <<-TEXT
      Please visit us at http://test.dev/
      TEXT

      @campaign.create_mail_template :name => 'test', :subject => 'test subject', :language => 'en', :template_type => 'campaign', :body_html => html, :body_text => text
      @campaign.mail_template.id.should_not be_nil

      mail_template = nil
      tracking_variables = []
      assert_difference 'MarketLink.count', 1 do
	mail_template, tracking_variables = @campaign.prepare_mail_template
      end
      tracking_variables.assoc('track:http://test.dev/').should_not be_nil
    end
  end

  describe "testing running the campaing" do
    before(:each) do
      @mm = SiteVersion.default.root.add_subpage 'test', 'M'
      @mm.module_name = '/mailing/mail'
      @mm.save.should be_true

      @user1 = EndUser.push_target('test1@test.dev')
      @user2 = EndUser.push_target('test2@test.dev')
      @campaign = MarketCampaign.create_custom_campaign('test', [@user1.id, @user2.id])

      @html = '<p>Please visit us at <a href="http://test.dev/">test.dev</a></p>'
      @text = 'Please visit us at http://test.dev/'

      @campaign.create_mail_template :name => 'test', :subject => 'test subject', :language => 'en', :template_type => 'campaign', :body_html => @html, :body_text => @text
      @message = MarketCampaignMessage.create :market_campaign_id => @campaign.id
      @campaign.status = 'initializing'
      @campaign.save
    end

    it "should initialize the campaign" do
      assert_difference 'MarketCampaignQueue.count', 2 do
	@campaign.send(:initialize_campaign)
      end

      @campaign.status.should == 'sending'
      @campaign.market_campaign_message.message_body['body_html'].should == @html
      @campaign.market_campaign_message.message_body['body_text'].should == @text

      MarketCampaignQueue.find_by_email(@user1.email).should_not be_nil
      @queue = MarketCampaignQueue.find_by_email(@user2.email)
      @queue.should_not be_nil
      @queue.market_campaign_id.should == @campaign.id
      @queue.model_id.should == @user2.id
      @queue.sent.should be_false
    end

    it "should send the campaign" do
      assert_difference 'MarketCampaignQueue.count', 2 do
	@campaign.send_campaign
      end

      @campaign.status.should == 'completed'

      @queue = MarketCampaignQueue.find_by_email(@user1.email)
      @queue.should_not be_nil
      @queue.market_campaign_id.should == @campaign.id
      @queue.model_id.should == @user1.id
      @queue.sent.should be_true
      @queue.handled.should be_true
    end
  end
end
