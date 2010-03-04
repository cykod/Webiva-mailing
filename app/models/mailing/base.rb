class Mailing::Base
  cattr_accessor :logger
  @@logger = ActiveRecord::Base.logger

  def initialize(campaign,options)
    @campaign = campaign
    @options = options
  end

  def valid?; true; end
end
