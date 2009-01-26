class MarketLinkEntry < DomainModel
  belongs_to :market_campaign_queue
  belongs_to :market_link
end
