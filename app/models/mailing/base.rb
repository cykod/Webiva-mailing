class Mailing::Base
  cattr_accessor :logger
  @@logger = ActiveRecord::Base.logger

  def initialize(campaign,options)
    @campaign = campaign
    @options = options
  end

  def valid?; true; end

  # required methods for senders
  # def prepare_mail_template(mail_template, online); end
  # def send!(mail_template, message, vars); end
  # def send_sample!(email,mail_template,vars); end
  # def options_description; end
end
