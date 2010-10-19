
class Mailing::WebivaSender < Mailing::Base
  
  SENDING_WINDOW_SIZE = 250
  
  def self.mailing_sender_handler_info
    { :name => 'Webiva Mailer'
    }
  end   
  
  def prepare_mail_template(mail_template,online)
    

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
  
  
  def send!(mail_template,message,vars)
    # Now we are sending
    entry_offset = 0
    
    tracking_variables = vars
    #mail_template,tracking_variables = prepare_mail_template(mail_template,false)
    mail_template.mailing_handler = Mailing::WebivaReceiver.to_s.underscore
    while true
      @campaign.reload
      # If the campaign has been paused or otherwise interrupted
      if @campaign.status != 'active'
        return
      end
      
      queues = @campaign.market_campaign_queues.find(:all,:conditions => 'handled=0',:limit => SENDING_WINDOW_SIZE)
      
      # If we're done
      # Update status to completed
      if queues.length == 0
        @campaign.reload(:lock => true)
        @campaign.status='completed'
        @campaign.save
        return
      end
      
      skip_count = 0
      sent_count = 0
      
      case @campaign.data_model
      when 'subscription':
          mdl = UserSubscriptionEntry
      when 'user_segment':
          mdl = EndUser
      else
        mdl = ContentModel.find(@campaign.data_model).content_model
      end

      queues.each do |queue|
	
        queue.handled = true

        skip_target = UserUnsubscription.find_by_email(queue.email) ? true : false
        skip_target ||= RFC822::EmailAddress.match(queue.email).nil?

        if skip_target
          skip_count += 1
        else
          
          entry = mdl.find_by_id(queue.model_id)
          if @campaign.data_model == 'subscription'
            entry = entry.end_user if entry.end_user_id
          end
          
          vars = message.field_values(entry.attributes,queue.queue_hash)
          vars.merge!(@campaign.add_tracking_links(tracking_variables,queue.queue_hash))
          
          @campaign.add_delivery_variables(vars)
          
	  begin
	    mail_template.webiva_message_id = "#{@campaign.identifier_hash}/#{queue.queue_hash}"
	    mail = MailTemplateMailer.deliver_to_address(queue.email,mail_template,vars)
	    queue.sent_at = Time.now
	    queue.sent = true
	    sent_count += 1
	  rescue SMTPError => e
	    queue.error = true
	    queue.handled = false
	    @campaign.status = 'error'
	    @campaign.error_message = e.to_s
	    @campaign.save
	    logger.error("Failed to send mail to #{queue.email} because '#{e}'")
	  rescue Exception => e
	    queue.error = true
	    @campaign.status = 'error'
	    @campaign.error_message = e.to_s
	    @campaign.save
	    logger.error("Failed to send mail to #{queue.email} because '#{e}'")
	  end
        end
        
        queue.save

        unless @campaign.status == 'active'
	  logger.warn("Stopping, campaign status changed to #{@campaign.status}")
	  break;
	end
      end 
      
      # Help the garbage collecting if we can
      queues = nil
      @campaign.reload(:lock => true)
      @campaign.stat_sent += sent_count
      @campaign.stat_skipped +=  skip_count
      
      @campaign.save

      GC.start

      
      # Go to sleep for a second to let everything catch up
      sleep(2)
      
      entry_offset += SENDING_WINDOW_SIZE
    end     
    
  end          
  
  def self.update_stats()
    return true
  end
  
  
  def send_sample!(email,mail_template,vars)
    begin
      MailTemplateMailer.deliver_to_address(email,mail_template,vars,'QUEUE')
      true
    rescue Exception => e
      logger.error( "Send sample email to #{email} failed: #{e}" )
      false
    end
  end
end
  
