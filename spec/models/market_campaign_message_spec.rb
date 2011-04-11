require "spec_helper"
require "mailing_spec_helper"

describe MarketCampaignMessage do

  reset_domain_tables :site_versions, :site_nodes, :market_campaigns, :market_campaign_messages, :end_users

  it "should return nil if no mail module was added" do
    @message = MarketCampaignMessage.new
    @message.get_mail_module_path.should be_nil
  end

  it "should return the mail module path" do
    mm = SiteVersion.default.root.add_subpage 'test', 'M'
    mm.module_name = '/mailing/mail'
    mm.save.should be_true
    @message = MarketCampaignMessage.new
    @message.get_mail_module_path.should include('/test')
  end

  it "should return the mail module path" do
    user = EndUser.create :email => 'test@test.dev', :first_name => 'First', :last_name => 'Last', :gender => 'm'
    mm = SiteVersion.default.root.add_subpage 'test', 'M'
    mm.module_name = '/mailing/mail'
    mm.save.should be_true
    campaign = MarketCampaign.create :name => 'test', :campaign_type => 'email'
    campaign.id.should_not be_nil
    @message = MarketCampaignMessage.create :market_campaign_id => campaign.id, :fields => {:name => 'name', :introduction => 'introduction', :first => 'first_name_friend', :last => 'last_name', :gender => 'gender', :unsubscribe => 'unsubscribe', :unsubscribe_href => 'unsubscribe_href', :view_online => 'view_online', :view_online_href => 'view_online_href'}
    @message.id.should_not be_nil
    @message.get_mail_module_path.should include('/test')

    vals = @message.field_values(user.attributes, 'test/queue')
    vals[:name].should == 'First Last'
    vals[:gender].should == 'm'
    vals[:introduction].should == 'Mr.'
    vals[:first].should == 'First'
    vals[:last].should == 'Last'
    link = "/unsubscribe/#{campaign.identifier_hash}/test/queue"
    vals[:unsubscribe].should include(link)
    vals[:unsubscribe_href].should include(link)
    link = "/mailing/view/#{campaign.identifier_hash}/test/queue"
    vals[:view_online].should include(link)
    vals[:view_online_href].should include(link)
  end

end
