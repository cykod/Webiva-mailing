class MailingCampaigns < ActiveRecord::Migration
  def self.up
    create_table :market_campaigns do |t|
      t.column :name, :string
      t.column :campaign_type, :string
      t.column :mail_template_id, :integer
      t.column :market_segment_id, :integer
      
      t.column :data_model, :string
      
      t.column :created_at, :datetime
      t.column :created_by_type, :string
      t.column :created_by_id, :integer
      
      t.column :send_at, :datetime
      
      t.column :identifier_hash, :string, :size => 16
      t.column :embed_images, :boolean, :default => false
      t.column :tracking_image, :boolean, :default => true
      t.column :tracking_image_filename, :string
      t.column :track_links, :boolean, :default => true
      
      t.column :status, :string, :default => 'created'
      
      t.column :stat_queue_size, :integer, :default => 0
      t.column :stat_skipped, :integer, :default => 0
      t.column :stat_sent, :integer, :default => 0
      t.column :stat_bounced_back, :integer, :default => 0
      t.column :stat_opened, :integer, :default => 0
      t.column :stat_clicked, :integer, :default => 0
      t.column :stat_unsubscribe, :integer, :default => 0
      t.column :stat_abuse, :integer, :default => 0
      
      t.column :from_email, :string
      
      t.column :sent_at, :datetime
      t.column :edited_at, :datetime
      t.column :archived, :boolean, :default => false
      t.column :description, :text      
      
      t.column :from, :string, :default => 'default'
      t.column :from_name, :string
      t.column :reply_to_name, :string
      t.column :reply_to_email, :string
      t.column :view_online, :boolean, :default => true      
    end
    

    create_table :market_links do |t|
      t.column :market_campaign_id, :integer
      t.column :link_to, :string
      t.column :link_hash, :string, :limit => 16
      t.column :unique_clicked, :integer, :default => 0
      t.column :clicked, :integer, :default => 0
    end
    
    add_index :market_links, :market_campaign_id, :name => 'market_campaign_id'
    add_index :market_links, :link_hash, :name => 'link_hash'
    
    create_table :market_link_entries do |t|
      t.column :market_link_id, :integer
      t.column :market_campaign_queue_id, :integer
      t.column :click_count, :integer, :default => 0
      t.column :first_clicked_at, :datetime
      t.column :last_clicked_at, :datetime
    end
    
    add_index :market_link_entries, [ :market_link_id, :market_campaign_queue_id ] , :name => 'link_queue'
  
    create_table :market_campaign_messages do |t|
      t.column :market_campaign_id, :integer
      t.column :message_body, :text
      t.column :fields, :text
    end
  
    add_index :market_campaign_messages, :market_campaign_id, :name => 'market_campaign_id'
    
    create_table :market_campaign_queues do |t|
      t.column :market_campaign_id, :integer
      t.column :model_id, :integer
      t.column :email, :string
      t.column :queue_hash, :string, :limit => 16
      t.column :message_id, :string
      t.column :handled, :boolean, :default => false
      t.column :skip, :boolean, :default => false
      t.column :sent, :boolean, :default => false
      t.column :bounced, :boolean, :default => false
      t.column :unsubscribed, :boolean, :default => false
      t.column :abuse, :boolean, :default => false
      t.column :opened, :boolean, :default => false
      t.column :opened_at, :datetime
      t.column :sent_at, :datetime
      t.column :click_count, :integer, :default => 0
    end
  
    add_index :market_campaign_queues, [ :market_campaign_id, :handled ], :name => 'market_campaign_id_handled'
    
    create_table :market_campaign_queue_sessions do |t|
      t.column :market_campaign_queue_id, :integer
      t.column :session_id, :string
      t.column :entry_created_at, :datetime
    end
    
    add_index :market_campaign_queue_sessions, [ :market_campaign_queue_id ], :name => 'market_campaign_queue_id'
    add_index :market_campaign_queue_sessions, [ :session_id ], :name => 'tracked_session'
    
  
 
    create_table :user_unsubscriptions do |t|
      t.column :email, :string
      t.column :unsubscription_type, :string # Automatic or Manual
      t.column :reason, :string
      t.column :unsubscribed_ip, :string
      t.column :unsubscribed_at, :datetime
    end
    
    add_index :user_unsubscriptions, :email, :name => 'email'
    
  end


  def self.down
    drop_table :market_campaigns
    drop_table :market_links
    drop_table :market_link_entries
    drop_table :market_campaign_messages
    drop_table :market_campaign_queues
    drop_table :market_campaign_queue_sessions
    drop_table :user_unsubscriptions
    end
end
