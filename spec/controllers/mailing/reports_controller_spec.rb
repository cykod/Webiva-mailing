require  File.expand_path(File.dirname(__FILE__)) + "/../../../../../../spec/spec_helper"

describe Mailing::ReportsController do

  reset_domain_tables :market_campaigns, :market_segments, :end_users, :market_campaign_messages, :site_versions, :site_nodes, :market_links, :market_campaign_queues, :mail_templates, :market_link_entries

  def create_ready_to_send_campaign
    @user1 = EndUser.push_target('test1@test.dev')
    @campaign = MarketCampaign.create_custom_campaign('campaign', [@user1.id])
    html = '<p>Please visit us at <a href="http://test.dev/">test.dev</a></p>'
    text = 'Please visit us at http://test.dev/'
    @campaign.create_mail_template :name => 'test', :subject => 'test subject', :language => 'en', :template_type => 'campaign', :body_html => html, :body_text => text
    @message = MarketCampaignMessage.create :market_campaign_id => @campaign.id
    @campaign.status = 'setup'
    @campaign.save
    @campaign
  end

  before(:each) do
    @mm = SiteVersion.default.root.add_subpage 'test', 'M'
    @mm.module_name = '/mailing/mail'
    @mm.save.should be_true
    @campaign = create_ready_to_send_campaign
    @campaign.status = 'initializing'
    @campaign.send_campaign
    @queue = @campaign.market_campaign_queues.find_by_email(@user1.email)
    @link = @campaign.market_links.create :link_to => 'http://www.test.dev/', :link_hash => 'link'
  end

  it "should handle campaign queues list" do 
    # Test all the permutations of an active table
    controller.should handle_active_table(:queue_table) do |args|
      args[:path] = [@user1.id]
      post 'display_queue_table', args
    end
  end

  it "should render user_mailing" do
    get 'user_mailing', :path => [@user1.id]
    response.should render_template('_user_mailing')
  end
end
