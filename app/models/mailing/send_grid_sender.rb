
class Mailing::SendGridSender < Mailing::Base

  SENDING_WINDOW_SIZE = 250

  def self.mailing_sender_handler_info
    { :name => 'Send Grid Mailer',
      :options_partial => '/mailing/senders/sendgrid_options'
    }
  end

  def self.options(hsh)
    Options.new(hsh)
  end

  def options_description; ''; end

  class Options < HashModel
    attributes :username => nil, :password => nil

    validates_presence_of :username, :password

    def validate
      data = self.service.get_profile
      if ! data || data['error']
        self.errors.add(:username, 'is invalid')
        self.errors.add(:password, 'is invalid')
      end
    end

    def service
      @service ||= SendGrid::WebService.new self.username, self.password
    end
  end

  def prepare_mail_template(mail_template, online)
    mail_template.replace_image_sources
    tracking_variables = []

    if @campaign.tracking_image?
      tracking_image_filename,tracking_image_variable = mail_template.replace_tracking_image
      @campaign.tracking_image_filename = tracking_image_filename
      tracking_variables << [ tracking_image_variable, "http://#{Configuration.full_domain}/mailing/image/#{@campaign.identifier_hash}/" ]
    end

    # Prepare template by sending market links
    # For replacement
    if @campaign.track_links?
      links = mail_template.track_link_hrefs
      tracking_variables += @campaign.generate_market_links(links)
    else
      mail_template.replace_link_hrefs
    end

    if(@campaign.view_online? && !online && mail_template.is_html) 
      view_online_variable = mail_template.view_online_href
      tracking_variables << [ view_online_variable, "http://#{Configuration.full_domain}/mailing/view/#{@campaign.identifier_hash}/" ]
    end

    unsubscribe_variable = mail_template.add_unsubscribe_links
    
    tracking_variables << [ unsubscribe_variable,  "#{@campaign.get_mail_module_path}/unsubscribe/#{@campaign.identifier_hash}/" ]

    mail_template.prepare_template

    return mail_template, tracking_variables  
  end  

  def send!(mail_template, message, tracking_variables)
    send_grid_vars = {}

    (message.fields||{}).each do |fld_orig,val|
      fld = fld_orig.downcase
      send_grid_vars[fld_orig] = "-#{fld}-"
    end

    tracking_variables.each do |fld_orig,val|
      next unless fld_orig
      fld = fld_orig.downcase
      send_grid_vars[fld_orig] = "-#{fld}-"
    end

    email_vars = send_grid_vars.clone
    @campaign.add_delivery_variables(email_vars)

    self.smtp.html = mail_template.is_html ? mail_template.render_html(email_vars) : nil
    self.smtp.text = mail_template.is_text ? mail_template.render_text(email_vars) : nil
    self.smtp.subject = mail_template.render_subject(email_vars)
    self.smtp.category_name = self.category_name
    self.smtp.from = email_vars['system:from']
    self.smtp.reply_to = email_vars['system:reply_to']

    mdl = nil
    case @campaign.data_model
    when 'subscription'
      mdl = UserSubscriptionEntry
    when 'user_segment'
      mdl = EndUser
    else
      mdl = ContentModel.find(@campaign.data_model).content_model
    end

    @campaign.market_campaign_queues.find_in_batches(:conditions => 'handled=0', :batch_size => SENDING_WINDOW_SIZE) do |queues|
      @campaign.reload
      # If the campaign has been paused or otherwise interrupted
      return unless @campaign.status == 'active'

      skip_count = 0
      sent_count = 0

      entries = mdl.find(:all, :conditions => {:id => queues.collect(&:model_id)}).index_by(&:id)
      skip_targets = UserUnsubscription.find(:all, :select => 'id, email', :conditions => {:email => queues.collect(&:email)}).index_by(&:email)

      self.smtp.receivers = []
      self.smtp.data = {}
      send_grid_vars.each { |fld_orig, fld| self.smtp.data[fld] = [] }

      queues.each do |queue|
        skip_target = skip_targets[queue.email] ? true : false
        skip_target ||= RFC822::EmailAddress.match(queue.email).nil?

        if skip_target
          skip_count += 1
        else
          entry = entries[queue.model_id]
          if @campaign.data_model == 'subscription'
            entry = entry.end_user if entry.end_user_id
          end

          vars = message.field_values(entry.attributes,queue.queue_hash)
          vars.merge!(@campaign.add_tracking_links(tracking_variables,queue.queue_hash))
          @campaign.add_delivery_variables(vars)

          self.smtp.receivers << queue.email
          send_grid_vars.each { |fld_orig, fld| self.smtp.data[fld] = vars[fld_orig] }
          sent_count += 1
        end
      end

      self.smtp.send

      # update queue items as handled
      MarketCampaignQueue.update_all ["handled = 1, sent = 1, sent_at = ?", Time.now], {:id =>  queues.collect(&:id)}

      @campaign.reload(:lock => true)
      @campaign.stat_sent += sent_count
      @campaign.stat_skipped +=  skip_count
      @campaign.save
    end
    
    # If we're done
    # Update status to completed
    if @campaign.market_campaign_queues.count(:conditions => 'handled=0') == 0
      @campaign.reload(:lock => true)
      @campaign.status = 'completed'
      @campaign.save
    end
  end          
  
  def update_stats
    totals = @options.service.get_all_time_totals self.category_name
    if totals && totals['bounces'].to_i > 0
      @options.service.get_bounces.each do |bounce|
        next unless bounce['status'] =~ /^5/
        queue = @campaign.market_campaign_queues.find_by_email bounce['email']
        if queue
          queue.update_attribute :bounced, true
          @options.service.delete_bounce 'email' => bounce['email']
        end
      end
    end

    @campaign.update_attributes(:stat_bounced_back => @campaign.market_campaign_queues.count(:conditions => {:bounced => true}),
                                :stats_updated_at => Time.now,
                                :stats_downloaded_at => Time.now
                                )

    true
  end

  def send_sample!(email,mail_template,vars)
    self.smtp.html = mail_template.is_html ? mail_template.render_html(vars) : nil
    self.smtp.text = mail_template.is_text ? mail_template.render_text(vars) : nil
    self.smtp.subject = mail_template.render_subject(vars)
    self.smtp.category_name = self.category_name
    self.smtp.from = vars['system:from']
    self.smtp.reply_to = vars['system:reply_to']
    self.smtp.receivers = [email]
    self.smtp.data = {}
    self.smtp.send
    true
  end

  def category_name
    DomainModel.active_domain_name + ':' + @campaign.name
  end

  def smtp
    @smtp ||= SendGrid::Smtp.new @options.username, @options.password
  end
end
