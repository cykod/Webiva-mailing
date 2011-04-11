require "spec_helper"
require "mailing_spec_helper"

describe SendGrid::WebService do

  before(:each) do
    FakeWeb.allow_net_connect = false
    FakeWeb.clean_registry
  end

  def fakeweb_send_grid_get_profile(body)
    url = "https://sendgrid.com/api/profile.get.json"
    FakeWeb.register_uri :post, url, :status => ['200', 'Ok'], :body => body.to_json, :content_type => 'application/jsonrequest'
  end

  def fakeweb_send_grid_get_stats(body)
    url = "https://sendgrid.com/api/stats.get.json"
    FakeWeb.register_uri :post, url, :status => ['200', 'Ok'], :body => body.to_json, :content_type => 'application/jsonrequest'
  end

  def fakeweb_send_grid_get_bounces(body)
    url = "https://sendgrid.com/api/bounces.get.json"
    FakeWeb.register_uri :post, url, :status => ['200', 'Ok'], :body => body.to_json, :content_type => 'application/jsonrequest'
  end

  it "should be able to get a profile" do
    test_profile = [{'username' => 'test@test.dev', 'email' => 'test@test.dev', 'active' => 'true', 'first_name' => 'Test', 'last_name' => 'Last', 'address' => '1 Test Lane', 'city' => 'Boston', 'zip' => '02111', 'state' => 'MA', 'country' => 'US', 'phone' => '555-555-5555', 'website' => 'webiva.com'}]
    fakeweb_send_grid_get_profile test_profile
    @service = SendGrid::WebService.new 'test@test.dev', 'password'
    profile = @service.get_profile
    profile['first_name'].should == 'Test'
  end

  it "should be able to get stats for a campaign" do
    fakeweb_send_grid_get_stats "name"=>"test.dev:Test", "blocks"=>"0", "spam_report"=>"0", "bounces"=>"1", "delivered"=>2, "unique_clicks"=>"0", "unsubscribes"=>"0", "clicks"=>"0", "requests"=>"3", "unique_opens"=>"0", "opens"=>"0"
    @service = SendGrid::WebService.new 'test@test.dev', 'password'
    stats = @service.get_all_time_totals 'test.dev:Test'
    stats['bounces'].to_i.should == 1
  end

  it "should be able to get bounces" do
    fakeweb_send_grid_get_bounces [{'email' => 'bouned@test.dev', 'reason' => 'host [127.0.0.1] said: 550 5.1.1 unknown or illegal user', "status" => "5.1.1", "created" => "2009-06-01 19:41:39"}]
    @service = SendGrid::WebService.new 'test@test.dev', 'password'
    bounces = @service.get_bounces
    bounces[0]['email'].should == 'bouned@test.dev'
  end
end
