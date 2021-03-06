require  File.expand_path(File.dirname(__FILE__)) + "/../../mailing_spec_helper"

describe Mailing::VerticalResponseSender do

  reset_domain_tables :market_campaigns, :market_segments, :end_users, :market_campaign_messages, :site_versions, :site_nodes, :market_links, :market_campaign_queues, :mail_templates, :user_subscription_entry, :user_subscription, :user_segment, :user_segment_cache

  def mock_vr_send
    @vr = VRAPI::VRAPIPortType.new
    VRAPI::VRAPIPortType.should_receive(:new).once.and_return(@vr)
    @vr.should_receive(:login).any_number_of_times.and_return("session")
    @vr.should_receive(:createEmailCampaign).and_return(3)
    @vr.should_receive(:createList).and_return(2)
    @vr.should_receive(:appendFileToList)
    @vr.should_receive(:setEmailCampaignAttribute).any_number_of_times
    @vr.should_receive(:setEmailCampaignContent).any_number_of_times
    @vr.should_receive(:setCampaignLists)
    @vr.should_receive(:launchEmailCampaign)
  end

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
    @campaign.sender_type = Mailing::VerticalResponseSender.to_s.underscore
    @campaign.save
  end

  it "should return the " do
    @sender = @campaign.sender_class
    @sender.instance_of?(Mailing::VerticalResponseSender).should be_true
  end

  it "should prepare_mail_template" do
    @sender = @campaign.sender_class
    mail_template, tracking_variables = @sender.prepare_mail_template(@campaign.get_mail_template, false)
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

    mock_vr_send
    @sender.send!(mail_template,message,tracking_variables)

    @queue.reload
    @queue.handled.should be_true
    @queue.sent.should be_true
  end

  it "should send sample" do
    @sender = @campaign.sender_class
    mail_template, tracking_variables = @sender.prepare_mail_template(@campaign.get_mail_template, false)
    vars = {}

    @vr = VRAPI::VRAPIPortType.new
    VRAPI::VRAPIPortType.should_receive(:new).and_return(@vr)
    @vr.should_receive(:login).and_return("session")
    @vr.should_receive(:createEmailCampaign).and_return(3)
    @vr.should_receive(:setEmailCampaignAttribute).any_number_of_times
    @vr.should_receive(:setEmailCampaignContent).any_number_of_times
    @vr.should_receive(:sendEmailCampaignTest)

    @sender.send_sample!('test@test.dev',mail_template,vars)
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
    mock_vr_send
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
    mock_vr_send
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
    mock_vr_send
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
end
