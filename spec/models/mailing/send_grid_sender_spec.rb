require  File.expand_path(File.dirname(__FILE__)) + "/../../mailing_spec_helper"

describe Mailing::SendGridSender do

  reset_domain_tables :market_campaigns, :market_segments, :end_users, :market_campaign_messages, :site_versions, :site_nodes, :market_links, :market_campaign_queues, :mail_templates, :user_subscription_entry, :user_subscription, :user_segment, :user_segment_cache

  def fakeweb_send_grid_get_stats(body)
    url = "https://sendgrid.com/api/stats.get.json"
    FakeWeb.register_uri :post, url, :status => ['200', 'Ok'], :body => body.to_json, :content_type => 'application/jsonrequest'
  end

  def fakeweb_send_grid_get_bounces(body)
    url = "https://sendgrid.com/api/bounces.get.json"
    FakeWeb.register_uri :post, url, :status => ['200', 'Ok'], :body => body.to_json, :content_type => 'application/jsonrequest'
  end

  def fakeweb_send_grid_delete_bounce
    url = "https://sendgrid.com/api/bounces.delete.json"
    body = {'message' => 'success'}
    FakeWeb.register_uri :post, url, :status => ['200', 'Ok'], :body => body.to_json, :content_type => 'application/jsonrequest'
  end

  before(:each) do
    FakeWeb.allow_net_connect = false
    FakeWeb.clean_registry

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
    @campaign.sender_type = Mailing::SendGridSender.to_s.underscore
    @campaign.save
  end

  it "should return the webiva sender" do
    @sender = @campaign.sender_class
    @sender.instance_of?(Mailing::SendGridSender).should be_true
  end

  it "should prepare_mail_template" do
    @sender = @campaign.sender_class
    mail_template, tracking_variables = @sender.prepare_mail_template(@campaign.get_mail_template, false)
    tracking_variables.assoc('track:http://test.dev/').should_not be_nil
  end

  it "should send the messages" do
    assert_difference 'MarketCampaignQueue.count', 2 do
      @campaign.send(:initialize_campaign)
    end

    @campaign.status = 'active'
    @campaign.save

    @queue = MarketCampaignQueue.find_by_email_and_market_campaign_id(@user1.email, @campaign.id)
    @queue.should_not be_nil
    @queue.market_campaign_id.should == @campaign.id
    @queue.model_id.should == @user1.id
    @queue.sent.should be_false
    @queue.handled.should be_false

    @sender = @campaign.sender_class
    mail_template, tracking_variables = @sender.prepare_mail_template(@campaign.get_mail_template, false)
    message = @campaign.market_campaign_message
    @smtp = SendGrid::Smtp.new 'test@test.dev', 'password'
    @smtp.should_receive(:send).any_number_of_times
    @sender.should_receive(:smtp).any_number_of_times.and_return(@smtp)
    @sender.send!(mail_template,message,tracking_variables)

    @queue.reload
    @queue.handled.should be_true
    @queue.sent.should be_true
  end

  it "should send sample" do
    @sender = @campaign.sender_class
    mail_template, tracking_variables = @sender.prepare_mail_template(@campaign.get_mail_template, false)
    vars = {}
    @smtp = SendGrid::Smtp.new 'test@test.dev', 'password'
    @smtp.should_receive(:send).any_number_of_times
    @sender.should_receive(:smtp).any_number_of_times.and_return(@smtp)
    @sender.send_sample!('test@test.dev',mail_template,vars)
  end

  it "should update stats" do
    assert_difference 'MarketCampaignQueue.count', 2 do
      @campaign.send(:initialize_campaign)
    end
    MarketCampaignQueue.update_all ['handled = 1, sent = 1, sent_at = ?', Time.now]

    fakeweb_send_grid_get_stats "name"=>"test.dev:Test", "blocks"=>"0", "spam_report"=>"0", "bounces"=>"1", "delivered"=>2, "unique_clicks"=>"0", "unsubscribes"=>"0", "clicks"=>"0", "requests"=>"3", "unique_opens"=>"0", "opens"=>"0"

    fakeweb_send_grid_get_bounces [{'email' => 'test2@test.dev', 'reason' => 'host [127.0.0.1] said: 550 5.1.1 unknown or illegal user', "status" => "5.1.1", "created" => "2009-06-01 19:41:39"}, {'email' => 'test1@test.dev', 'reason' => 'host [127.0.0.1] said: 550 4.1.1 Busy', "status" => "4.1.1", "created" => "2009-06-01 19:41:39"}]

    fakeweb_send_grid_delete_bounce

    @sender = @campaign.sender_class
    @sender.update_stats

    MarketCampaignQueue.count(:conditions => {:bounced => true}).should == 1
  end

  it "should skip invalid emails" do
    @user3 = EndUser.create :username => 'testuser3', :admin_edit => true
    @user3.id.should_not be_nil

    @user_segment = UserSegment.create(:name => 'test invalid email', :segment_type => 'custom')
    @user_segment.add_ids [@user1.id, @user2.id, @user3.id]
    @user_segment.market_segment.market_campaign_id = @campaign.id
    @user_segment.market_segment.save

    @campaign.reload
    @campaign.update_attribute(:market_segment_id, @user_segment.market_segment_id)
    @campaign.data_model.should == 'user_segment'

    assert_difference 'MarketCampaignQueue.count', 3 do
      @campaign.send(:initialize_campaign)
    end

    @campaign.status = 'active'
    @campaign.save

    @queue1 = MarketCampaignQueue.find_by_email_and_market_campaign_id(@user1.email, @campaign.id)
    @queue1.should_not be_nil
    @queue1.market_campaign_id.should == @campaign.id
    @queue1.model_id.should == @user1.id
    @queue1.sent.should be_false
    @queue1.handled.should be_false

    @queue2 = MarketCampaignQueue.find_by_email_and_market_campaign_id(@user2.email, @campaign.id)
    @queue2.should_not be_nil

    @queue3 = MarketCampaignQueue.find_by_email_and_market_campaign_id(@user3.email, @campaign.id)
    @queue3.should_not be_nil

    @sender = @campaign.sender_class
    mail_template, tracking_variables = @sender.prepare_mail_template(@campaign.get_mail_template, false)
    message = @campaign.market_campaign_message
    @smtp = SendGrid::Smtp.new 'test@test.dev', 'password'
    @smtp.should_receive(:send).any_number_of_times
    @sender.should_receive(:smtp).any_number_of_times.and_return(@smtp)
    @sender.send!(mail_template,message,tracking_variables)

    @queue1.reload
    @queue1.handled.should be_true
    @queue1.sent.should be_true

    @queue2.reload
    @queue2.handled.should be_true
    @queue2.sent.should be_true

    @queue3.reload
    @queue3.handled.should be_true
    @queue3.sent.should be_false
    @queue3.skip.should be_true

    @campaign.reload
    @campaign.stat_sent.should == 2
    @campaign.stat_skipped.should == 1
  end

  it "should try to send to everyone" do
    @user3 = EndUser.create :username => 'testuser3', :admin_edit => true
    @user3.id.should_not be_nil

    MarketSegment.push_everyone_segment.segment_type.should == 'everyone'

    @campaign.reload
    @campaign.update_attribute(:market_segment_id, MarketSegment.push_everyone_segment.id)
    @campaign.data_model.should == 'everyone'

    assert_difference 'MarketCampaignQueue.count', 3 do
      @campaign.send(:initialize_campaign)
    end

    @campaign.status = 'active'
    @campaign.save

    @queue1 = MarketCampaignQueue.find_by_email_and_market_campaign_id(@user1.email, @campaign.id)
    @queue1.should_not be_nil
    @queue1.market_campaign_id.should == @campaign.id
    @queue1.model_id.should == @user1.id
    @queue1.sent.should be_false
    @queue1.handled.should be_false

    @queue2 = MarketCampaignQueue.find_by_email_and_market_campaign_id(@user2.email, @campaign.id)
    @queue2.should_not be_nil

    @queue3 = MarketCampaignQueue.find_by_email_and_market_campaign_id(@user3.email, @campaign.id)
    @queue3.should_not be_nil

    @sender = @campaign.sender_class
    mail_template, tracking_variables = @sender.prepare_mail_template(@campaign.get_mail_template, false)
    message = @campaign.market_campaign_message
    @smtp = SendGrid::Smtp.new 'test@test.dev', 'password'
    @smtp.should_receive(:send).any_number_of_times
    @sender.should_receive(:smtp).any_number_of_times.and_return(@smtp)
    @sender.send!(mail_template,message,tracking_variables)

    @queue1.reload
    @queue1.handled.should be_true
    @queue1.sent.should be_true

    @queue2.reload
    @queue2.handled.should be_true
    @queue2.sent.should be_true

    @queue3.reload
    @queue3.handled.should be_true
    @queue3.sent.should be_false
    @queue3.skip.should be_true

    @campaign.reload
    @campaign.stat_sent.should == 2
    @campaign.stat_skipped.should == 1
  end

  it "should send to a subscription" do
    @subscription = UserSubscription.create :name => 'Test Subscription'
    @subscription.user_subscription_entries.create :end_user_id => @user1.id, :verified => 1, :subscribed => 1
    @subscription.user_subscription_entries.create :end_user_id => @user2.id, :verified => 1, :subscribed => 1
    @subscription.reload

    @subscription.user_subscription_entries.count.should == 2
    @campaign.reload
    @campaign.update_attribute(:market_segment_id, @subscription.market_segment.id)
    @campaign.data_model.should == 'subscription'

    assert_difference 'MarketCampaignQueue.count', 2 do
      @campaign.send(:initialize_campaign)
    end

    @campaign.status = 'active'
    @campaign.save

    @queue1 = MarketCampaignQueue.find_by_email_and_market_campaign_id(@user1.email, @campaign.id)
    @queue1.should_not be_nil
    @queue1.market_campaign_id.should == @campaign.id
    @queue1.model_id.should == @user1.id
    @queue1.sent.should be_false
    @queue1.handled.should be_false

    @queue2 = MarketCampaignQueue.find_by_email_and_market_campaign_id(@user2.email, @campaign.id)
    @queue2.should_not be_nil

    @sender = @campaign.sender_class
    mail_template, tracking_variables = @sender.prepare_mail_template(@campaign.get_mail_template, false)
    message = @campaign.market_campaign_message
    @smtp = SendGrid::Smtp.new 'test@test.dev', 'password'
    @smtp.should_receive(:send).any_number_of_times
    @sender.should_receive(:smtp).any_number_of_times.and_return(@smtp)
    @sender.send!(mail_template,message,tracking_variables)

    @queue1.reload
    @queue1.handled.should be_true
    @queue1.sent.should be_true

    @queue2.reload
    @queue2.handled.should be_true
    @queue2.sent.should be_true

    @campaign.reload
    @campaign.stat_sent.should == 2
    @campaign.stat_skipped.should == 0
  end

  it "should recover from smtp error" do
    assert_difference 'MarketCampaignQueue.count', 2 do
      @campaign.send(:initialize_campaign)
    end

    @campaign.status = 'active'
    @campaign.save

    @queue = MarketCampaignQueue.find_by_email_and_market_campaign_id(@user1.email, @campaign.id)
    @queue.should_not be_nil
    @queue.market_campaign_id.should == @campaign.id
    @queue.model_id.should == @user1.id
    @queue.sent.should be_false
    @queue.handled.should be_false

    @sender = @campaign.sender_class
    mail_template, tracking_variables = @sender.prepare_mail_template(@campaign.get_mail_template, false)
    message = @campaign.market_campaign_message
    @smtp = SendGrid::Smtp.new 'test@test.dev', 'password'
    @smtp.should_receive(:send).and_raise(Net::SMTPSyntaxError.new 'test')
    @sender.should_receive(:smtp).any_number_of_times.and_return(@smtp)
    @sender.send!(mail_template,message,tracking_variables)

    @queue.reload
    @queue.handled.should be_false
    @queue.sent.should be_false

    @campaign.reload
    @campaign.status.should == 'error'
    @campaign.error_message.should == 'test'
  end
end
