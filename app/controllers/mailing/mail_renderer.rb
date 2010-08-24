class Mailing::MailRenderer < ParagraphRenderer
  
  paragraph :verify
  
  def verify
  
    render_paragraph :text => 'Please Verify This'
  end
  
  DEFAULT_UNSUBSCRIBE_TEXT = 'Please confirm your email address below and click "unsubscribe" to permanently remove yourself from any mailings from this site.'
  DEFAULT_UNSUBSCRIBED_TEXT = 'Your Unsubscription request has been received and processed. Please allow upto 48 hours to this change to take effect.'
  
  
  paragraph :unsubscribe
  
  def unsubscribe
    conn_type, campaign_hash = page_connection(:campaign_hash)
    conn_type, queue_hash = page_connection(:queue_hash)
    
    @campaign = MarketCampaign.find_by_identifier_hash(campaign_hash)
    @queue= @campaign.market_campaign_queues.find_by_queue_hash(queue_hash)  if @campaign
    
    @unsubscribe_email = @queue ? @queue.email : ''
    
    modifier = site_node.page_modifier.modifier_data || {}
    
    
    @unsubscribe = UserUnsubscription.new(params[:unsubscribe])
    
    @text = modifier[:unsubscribe_text] || DEFAULT_UNSUBSCRIBE_TEXT.t
    
    if request.post? && params[:unsubscribe] && !params[:unsubscribe][:email].blank?
      
      @unsubscribe.unsubscribed_ip = request.remote_ip
      @unsubscribe.unsubscribed_at = Time.now
      @unsubscribe.unsubscription_type = 'manual'
      
      if @unsubscribe.save
	if @queue && @campaign
	  @queue.reload(:lock => true)
	  @campaign.reload(:lock => true)
	  
	  if !@queue.unsubscribed
	    @queue.unsubscribed = true
	    @queue.save
	    @campaign.stat_unsubscribe += 1
	    @campaign.save
	  end
	end
	@unsubscribed = true
	@text = modifier[:unsubscribed_text] || DEFAULT_UNSUBSCRIBED_TEXT.t

        @user = EndUser.push_target @queue.email, :source => 'website', :no_register => true
        @user.unsubscribe

	paragraph_action('Unsubscribe',@unsubscribe.email)
      end
    else 
      @unsubscribe.email = @unsubscribe_email
    end
    
    
    
     render_paragraph :partial => '/mailing/mail/unsubscribe', :locals => { :unsubscribed => @unsubscribed,
                                                                           :info_text => @text,
                                                                           :unsubscribe => @unsubscribe }
  
  end
  
end
