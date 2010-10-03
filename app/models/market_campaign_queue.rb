class MarketCampaignQueue < DomainModel
  has_many :market_link_entries  
  has_many :market_campaign_queue_sessions
  
  belongs_to :market_campaign

  def end_user
    if self.market_campaign.data_model == 'content_model'
      EndUser.find_by_email self.email
    else
      EndUser.find_by_id self.model_id
    end
  end
end
