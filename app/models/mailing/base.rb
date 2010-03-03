class Mailing::Base
  cattr_accessor :logger

  def initialize(campaign,options)
    @campaign = campaign
    @options = options
    self.logger = ActiveRecord::Base.logger
  end

  def valid?; true; end
  def test(mail_template,message,vars); true; end
end