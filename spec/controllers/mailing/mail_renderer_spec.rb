require  File.expand_path(File.dirname(__FILE__)) + "/../../../../../../spec/spec_helper"

describe Mailing::MailRenderer, :type => :controller do
  controller_name :page
  
  integrate_views

  reset_domain_tables :site_versions, :site_nodes, :user_unsubscriptions

  def generate_page_renderer(paragraph, options={}, inputs={})
    @rnd = build_renderer('/page', '/mailing/mail/' + paragraph, options, inputs)
  end

  before(:each) do
    mod = SiteModule.activate_module(Domain.find(DomainModel.active_domain_id),'mailing')
    mod.update_attributes(:status => 'active')
    @mm = SiteVersion.default.root.add_subpage 'mail', 'M'
    @mm.module_name = '/mailing/mail'
    @mm.save
  end

  it "should render the unsubscribe paragraph" do
    @rnd = generate_page_renderer('unsubscribe')
    @rnd.site_node.save.should be_true
    renderer_get @rnd
  end

  it "should be able to unsubscribe" do
    @rnd = generate_page_renderer('unsubscribe')
    @rnd.site_node.save.should be_true
    assert_difference 'UserUnsubscription.count', 1 do
      renderer_post @rnd, :unsubscribe => {:email => 'test@test.dev'}
    end
    @unsubscribe = UserUnsubscription.find_by_email('test@test.dev')
    @unsubscribe.should_not be_nil
  end
end
