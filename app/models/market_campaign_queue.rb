class MarketCampaignQueue < DomainModel
  has_many :market_link_entries  
  has_many :market_campaign_queue_sessions
  
  belongs_to :market_campaign
end
