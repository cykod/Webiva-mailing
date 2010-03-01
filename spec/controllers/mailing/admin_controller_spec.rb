require  File.expand_path(File.dirname(__FILE__)) + "/../../mailing_spec_helper"

describe Mailing::AdminController do

  before(:each) do
    @mm = SiteVersion.default.root.add_subpage 'test', 'M'
    @mm.module_name = '/mailing/mail'
    @mm.save.should be_true
  end

  it "should render the options" do
    mock_editor
    get 'options'
    response.should render_template('options')
  end

  it "should save options" do
    mock_editor
    post 'options', :options => {:default_sender => 'mailing/webiva_sender'}
    response.should redirect_to(:controller => '/modules')
  end

  it "should render the mail module setup page" do
    mock_editor
    get 'mail', :path => [@mm.id]
    response.should render_template('mail')
  end

  it "should be able to change subscribe and unsubscribe text" do
    mock_editor
    post 'mail', :path => [@mm.id], :options => {:unsubscribe_text => 'Unsubscribe', :unsubscribed_text => 'Unsubscribed'}
    response.should render_template('mail')
    @mm.reload
    @mm.page_modifier.modifier_data[:unsubscribe_text].should == 'Unsubscribe'
    @mm.page_modifier.modifier_data[:unsubscribed_text].should == 'Unsubscribed'
  end
end
