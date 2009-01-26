class CampaignsAddedFields < ActiveRecord::Migration
  def self.up
    add_column :market_campaigns, :sender_type, :string, :default => 'mailing/webiva_sender'
    add_column :market_campaigns, :sender_data, :text
  end


  def self.down
    remove_column :market_campaigns, :sender_type
    remove_column :market_campaigns, :sender_data
  end
end
