require "spec_helper"
require "mailing_spec_helper"

describe Mailing::WebivaReceiver do

  reset_domain_tables :market_campaigns, :market_campaign_queues

  before(:each) do
    @campaign = MarketCampaign.create :name => 'test', :identifier_hash => 'campaign-hash', :campaign_type => 'email', :status => 'completed'
    @queue = @campaign.market_campaign_queues.create :queue_hash => 'queue-hash', :email => 'test@test2.dev'
  end

  it "should set the market_campaign_queue as bounced" do
    @email = Mail::Message.new
    @email.to = 'test@test.dev'
    @email.from = 'admin@test.dev'
    @email.headers 'X-Webiva-Domain' => DomainModel.active_domain_name, 'X-Webiva-Handler' => 'test/handler', 'X-Webiva-Message-Id' => "#{@campaign.identifier_hash}/queue-hash"
    @email.body = 'Test Body'
    
    @status = Mail::Message.new
    @status.content_type = 'message/delivery-status'
    @status.body = 'Status: 5.4.4'

    @orginal = Mail::Message.new
    @orginal.content_type 'message/rfc822'
    @orginal.body = @email.to_s

    @bounce = Mail::Message.new
    @bounce.content_type = 'multipart/report report-type=delivery-status; boundary=xxxxxx'
    @bounce.mime_version = '1.0'
    @bounce.body = "--xxxxxx\n" + @status.to_s + "\n--xxxxxx\n" + @orginal.to_s

    Mailing::WebivaReceiver.receive(@bounce)

    @queue.reload
    @queue.bounced.should be_true
    @campaign.reload
    @campaign.stat_bounced_back.should == 1
  end
end
