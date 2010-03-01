class ErrorHandling < ActiveRecord::Migration
  def self.up
    add_column :market_campaigns, :error_message, :text
    add_column :market_campaign_queues, :error, :boolean
  end

  def self.down
    remove_column :market_campaigns, :error_message
    remove_column :market_campaign_queues, :error
  end
end
