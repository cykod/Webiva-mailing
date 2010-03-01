require  File.expand_path(File.dirname(__FILE__)) + "/../../mailing_spec_helper"

describe Mailing::VerticalResponseSender do

  reset_domain_tables :market_campaigns, :market_segments, :end_users, :market_campaign_messages, :site_versions, :site_nodes, :market_links, :market_campaign_queues, :mail_templates

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

    @vr = VRAPI::VRAPIPortType.new
    VRAPI::VRAPIPortType.should_receive(:new).and_return(@vr)
    @vr.should_receive(:login).and_return("session")
    @vr.should_receive(:createEmailCampaign).and_return(3)
    @vr.should_receive(:createList).and_return(2)
    @vr.should_receive(:appendFileToList)
    @vr.should_receive(:setEmailCampaignAttribute).any_number_of_times
    @vr.should_receive(:setEmailCampaignContent).any_number_of_times
    @vr.should_receive(:setCampaignLists)
    @vr.should_receive(:launchEmailCampaign)
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
end
