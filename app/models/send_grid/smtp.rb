
require 'net/smtp'

class SendGrid::Smtp
  attr_accessor :subject, :text, :html, :category_name, :from, :to, :reply_to, :receivers, :data

  def initialize(username, password)
    @username = username
    @password = password
    @to = 'doesntmatter@nowhere.com'
  end

  def send
    smtp = Net::SMTP.start('smtp.sendgrid.net', 25, self.from, @username, @password, :plain)
    smtp.send_message self.message, self.from, self.to
    smtp.finish
  end

  def message
    if self.html && self.text
      self.mime_message
    elsif self.html
      self.html_message
    else
      self.text_message
    end
  end

  def x_smtp_api_header
    hdr = SendGrid::SmtpApiHeader.new
    hdr.addTo self.receivers
    hdr.setCategory self.category_name

    (self.data || {}).each do |name, values|
      hdr.addSubVal name, values
    end

    "X-SMTPAPI: %s\n" %hdr.asJSON()
  end

  # simple function to create a multipart MIME email
  # specify from to subject plaintext htmltext and an smtpapi header
  def mime_message
    boundary = "----------=_" + rand(99999999999999999).to_s.center(20, rand(9).to_s)
    content = "Content-Type: multipart/alternative; boundary=\"" + boundary + "\"\n"
    encoding = "Content-Transfer-Encoding: binary\nMIME-Version: 1.0\n"
    mimetype = "This is a multi-part message in MIME format...\n\n--" + boundary + "\n"
    textDefine = "Content-Type: text/plain\nContent-Disposition: inline\nContent-Transfer-Encoding: 7bit\n\n"
    htmlDefine = "Content-Type: text/html\nContent-Disposition: inline\nContent-Transfer-Encoding: 7bit\n\n"
    content + encoding + self.basic_headers + "\n" + mimetype + textDefine + self.text + "\n--" + boundary + "\n" + htmlDefine + self.html + "\n--" + boundary + "--\n\n"
  end

  def html_message
    content = "Content-Type: text/html\nContent-Disposition: inline\nContent-Transfer-Encoding: 7bit\n"
    encoding = "Content-Transfer-Encoding: binary\nMIME-Version: 1.0\n"
    content + encoding + self.basic_headers + "\n" + self.html + "\n"
  end

  def text_message
    content = "Content-Type: text/plain\nContent-Disposition: inline\nContent-Transfer-Encoding: 7bit\n"
    encoding = "Content-Transfer-Encoding: binary\nMIME-Version: 1.0\n"
    content + encoding + self.basic_headers + "\n" + self.text + "\n"
  end

  def basic_headers
    f = "From: %s\n" % self.from
    t = "To: %s\n" % self.to
    s = "Subject: %s\n" % self.subject
    r = self.reply_to ? "Reply-To: %s\n" % self.reply_to : ''
    f + r + t + s + self.x_smtp_api_header
  end    
end
