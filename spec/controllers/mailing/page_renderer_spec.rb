require  File.expand_path(File.dirname(__FILE__)) + "/../../mailing_spec_helper"

describe Mailing::PageRenderer, :type => :controller do
  controller_name :page

  integrate_views

  reset_domain_tables :mail_templates

  def generate_page_renderer(paragraph, options={}, inputs={})
    @rnd = build_renderer('/page', '/mailing/page/' + paragraph, options, inputs)
  end

  before(:each) do
    @mail_template = MailTemplate.create :name => 'Test Template', :subject => 'Test Subject', :language => 'en', :template_type => 'campaign'
  end

  it "should render the mail_template_list paragraph" do
    @rnd = generate_page_renderer('mail_template_list')
    renderer_get @rnd
  end

end
