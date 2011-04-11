require "spec_helper"
require "mailing_spec_helper"

describe SendGrid::Smtp do

  it "should be able to construct a message" do
    @smtp = SendGrid::Smtp.new "test@test.dev", "password"
    @smtp.subject = "Test Subject"
    @smtp.text = 'Hello -name-, this is a test'
    @smtp.html = '<p>Hello -name-, this is a test</p>'
    @smtp.category_name = "Test Category"
    @smtp.from = "Test <test@test.dev>"
    @smtp.reply_to = "test@test.dev"
    @smtp.receivers = ['user1@test.dev']
    @smtp.data = {'-name-' => ['User1']}

    x_smtp_api_header = @smtp.x_smtp_api_header

    @smtp.message.gsub(/-+=_\d+/, '-boundary').should == "Content-Type: multipart/alternative; boundary=\"-boundary\"\nContent-Transfer-Encoding: binary\nMIME-Version: 1.0\nFrom: Test <test@test.dev>\nReply-To: test@test.dev\nTo: doesntmatter@nowhere.com\nSubject: Test Subject\n#{x_smtp_api_header}\nThis is a multi-part message in MIME format...\n\n-boundary\nContent-Type: text/plain\nContent-Disposition: inline\nContent-Transfer-Encoding: 7bit\n\nHello -name-, this is a test\n-boundary\nContent-Type: text/html\nContent-Disposition: inline\nContent-Transfer-Encoding: 7bit\n\n<p>Hello -name-, this is a test</p>\n-boundary--\n\n"

    @smtp.text = nil
    @smtp.message.gsub(/-+=_\d+/, '-boundary').should == "Content-Type: text/html\nContent-Disposition: inline\nContent-Transfer-Encoding: 7bit\nContent-Transfer-Encoding: binary\nMIME-Version: 1.0\nFrom: Test <test@test.dev>\nReply-To: test@test.dev\nTo: doesntmatter@nowhere.com\nSubject: Test Subject\n#{x_smtp_api_header}\n<p>Hello -name-, this is a test</p>\n"

    @smtp.html = nil
    @smtp.text = 'Hello -name-, this is a test'
    @smtp.message.gsub(/-+=_\d+/, '-boundary').should == "Content-Type: text/plain\nContent-Disposition: inline\nContent-Transfer-Encoding: 7bit\nContent-Transfer-Encoding: binary\nMIME-Version: 1.0\nFrom: Test <test@test.dev>\nReply-To: test@test.dev\nTo: doesntmatter@nowhere.com\nSubject: Test Subject\n#{x_smtp_api_header}\nHello -name-, this is a test\n"

    @smtp.reply_to = nil
    @smtp.message.gsub(/-+=_\d+/, '-boundary').should == "Content-Type: text/plain\nContent-Disposition: inline\nContent-Transfer-Encoding: 7bit\nContent-Transfer-Encoding: binary\nMIME-Version: 1.0\nFrom: Test <test@test.dev>\nTo: doesntmatter@nowhere.com\nSubject: Test Subject\n#{x_smtp_api_header}\nHello -name-, this is a test\n"
  end
end
