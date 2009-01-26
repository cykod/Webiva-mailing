class CampaignsStatistics  < ActiveRecord::Migration
  def self.up
    add_column :market_campaigns, :stats_updated_at, :datetime
    add_column :market_campaigns, :stats_downloaded_at, :datetime
  end


  def self.down
    remove_column :market_campaigns, :stats_updated_at
    remove_column :market_campaigns, :stats_downloaded_at
  end
end
