require "digest/sha1"


class MarketCampaign < DomainModel

  validates_presence_of :name, :campaign_type 
  validates_uniqueness_of :name
  
  has_many :market_campaign_queues, :dependent => :delete_all
  has_many :market_links, :dependent => :destroy
  
  belongs_to :created_by, :polymorphic => true
  belongs_to :market_segment
  belongs_to :mail_template
  
  serialize :sender_data
  
  has_one :market_campaign_message, :dependent => :destroy
  
  has_options :campaign_type, [ [ 'Email Blast','email'],
                                [ 'Triggered Email','trigger' ] ]
  
  has_options :status, [ ['In Construction', 'created' ],
                         ['In Construction','setup'],
                         ['Generating Recipient List','initializing'], 
                         ['Sending','sending'],
                         ['Sending','active'],
                         ['Sent','completed'],
                         ['Paused','pause'],
                         ['Error','error']
                       ]

  QUEUE_WINDOW_SIZE = 1000

  def self.create_custom_campaign(name,user_ids)
    campaign = self.create(:name => name,:campaign_type=>'email',:data_model => 'members')
    segment = MarketSegment.create_custom(campaign,user_ids)
    campaign.update_attribute(:market_segment_id, segment.id)
    campaign
  end
  
  def after_create
    self.identifier_hash = create_hash(self.name + self.id.to_s)
    self.save
  end
  
  def stat_delivered
    self.stat_sent - self.stat_bounced_back
  end
  
  def stat_processed
    self.stat_skipped + self.stat_sent
  end
  
  def under_construction?
    return %w(created setup).include?(self.status)
  end

  def can_resend?
    return %w(error pause).include?(self.status)
  end

  def valid_market_segment?
    self.market_segment && self.market_segment.target_count > 0
  end

  def stat_processed_percentage
    percent = self.stat_processed.to_f * 100 / self.stat_queue_size
    percent = 100 if percent > 100
    percent = 0 if percent < 0
    
    percent
  end
  
  def get_mail_template
    if !self.under_construction? && self.status != 'initializing'
      MailTemplate.new(self.market_campaign_message.message_body)
    else
      self.mail_template
    end
  end
  
  def run_campaign(parameters=nil)
    self.run_worker(:send_campaign, parameters)
  end

  def send_campaign(args=nil)
    # If we are initializing
    # need to create the queue
    if self.status == 'initializing'
      initialize_campaign
    end
    
    if self.status == 'sending'
      self.status = 'active' 
      self.save

      mail_template, tracking_variables = prepare_mail_template
      
      message = self.market_campaign_message
      sender = self.sender_class
      sender.send!(mail_template,message,tracking_variables)
    end
  end
  
  def update_stats(args={})
    sender = self.sender_class
    sender.update_stats
  end
  
  # Prepare a mail template for sending
  # by adding tracking images and links if necessary
  def prepare_mail_template(online = false)
    self.sender_class.prepare_mail_template(self.get_mail_template, online)
  end
  
  
  # Create a variables hash for rendering the mail template
  # that has the queue hash linked to it
  def add_tracking_links(tracking_vars,queue_hash)
    vars = {}
    tracking_vars.each do |var|
      vars[var[0]] = var[1] + queue_hash
    end
  
    vars
  end
  
  def add_delivery_variables(vars)
    if self.from == 'custom' && (!self.from_email.blank? || !self.from_name.blank?)
      if !self.from_name.blank?
	vars['system:from'] = self.from_name
	vars['system:from'] += ' <' + ( self.from_email.blank? ?  Configuration.reply_to_email : "#{self.from_email}@#{Configuration.domain}" ) + ">"
      else
	vars['system:from'] = "#{self.from_email}@#{Configuration.domain}"
      end
    else
      vars['system:from'] = "#{Configuration.mailing_from} <#{Configuration.reply_to_email}>"
    end
    
    if !self.reply_to_email.blank?
      if !self.reply_to_name.blank?
      	vars['system:reply_to'] = self.reply_to_name
	vars['system:reply_to'] += ' <' + ( self.reply_to_email.blank? ? Configuration.reply_to_email : "#{self.reply_to_email}@#{Configuration.domain}" ) + ">"
      else
      	vars['system:reply_to'] = "#{self.reply_to_email}@#{Configuration.domain}"
      end
    end

    vars['system:from_name'] = self.from_name.blank? ? Configuration.mailing_from : self.from_name
  end

  def sender_class
    self.sender_type ||= 'mailing/webiva_sender'
    cls = self.sender_type.classify.constantize
    cls_info = cls.mailing_sender_handler_info
    if cls_info[:options_partial]
      config_opts = Configuration.get_config_model(Mailing::AdminController::ModuleOptions)
      cls_opts = cls.options(config_opts.senders[self.sender_type])
    else
      cls_opts = {}
    end
    
    cls.new(self,cls_opts)
  end

  def get_mail_module_path
    self.market_campaign_message.get_mail_module_path
  end
  
  def generate_market_links(links)
    
    # Take each link,
    # Generate a link hash and a link_to
    market_links = links.collect do |link|
      ml = self.market_links.find_by_link_to(link)
      
      if !ml
	ml = self.market_links.create(
	  :link_to => link,
	  :link_hash => create_hash(link)
	)
      end
      ml
    end
    
    variables = market_links.collect do |ml|
      [ 'track:' + ml[:link_to], "http://#{Configuration.full_domain}/mailing/link/#{self.identifier_hash}/#{ml.link_hash}/" ]
    end
    
    variables
  end
  
  private
  
  # Initialize a campaign to start sending
  def initialize_campaign
    # Generate the market campaign queue
    entry_count = self.market_segment.target_count
    
    # Generate Queue in chunks of 1000
    entry_offset = 0
    
    entry_total = 0
    while entry_offset < entry_count
      targets = self.market_segment.target_entries(:limit => QUEUE_WINDOW_SIZE,:offset => entry_offset)
      
      if !targets[0].blank?
        targets.each do |target|
	        self.market_campaign_queues.create(
	          :model_id => target[2],
	          :email => target[0]
	        )
        end
        entry_total += targets.length
      end
        
      # Help the garbage collecting if we can
      targets = nil

      GC.start

      
      entry_offset += QUEUE_WINDOW_SIZE      
      self.update_attribute(:stat_queue_size,entry_count)
    end
    
    # Do this so we can reload with a lock 
    # to update the sent time
    mail_template = MailTemplate.find_by_id(self.mail_template_id)
    
    # Clear out any previous market links 
    self.market_links.clear
    
    mail_template, tracking_variables = prepare_mail_template(false)
    
    self.stat_queue_size = entry_total
    # TODO: Allow delayed sending
    
    mail_template.update_attribute(:last_sent_at,Time.now)
    
    mail_template_attributes = mail_template.attributes
    # Save the attachments to a ID attachment list
    mail_template_attributes['attachment_list'] = mail_template.domain_files.collect { |df| df.id }
    self.market_campaign_message.update_attribute(:message_body,mail_template_attributes)
    
    
    seg = MarketSegment.find(self.market_segment_id,:lock => true)
    seg.update_attribute(:last_sent_at,Time.now)
    
    self.sent_at = Time.now
    self.status = 'sending'
    self.save
  end

  # Generate a unique, semi-random hash for links, campaigns and queues
  def create_hash(str)
    val = str + Time.now.to_s+(Process.pid + Process.pid + str.object_id).to_s
    Digest::SHA1.hexdigest(val).upcase[-16..-1]
  end
end
