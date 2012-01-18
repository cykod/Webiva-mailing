require 'csv'
require 'timeout'
require 'net/http'
require 'net/smtp'
require 'uri'

class CampaignsController < ModuleController

  layout 'manage'
  
  permit 'mailing_mailing', :except => [ :view, :link, :image ]
  
  component_info 'Mailing'
  
  skip_before_filter :context_translate_before, :only => [ :view, :link, :image ]
  skip_after_filter :context_translate_after, :only => [ :view, :link, :image ]
  skip_before_filter :check_ssl, :only => [ :view, :link, :image ]
  skip_before_filter :validate_is_editor, :only => [ :view, :link, :image ]
  
  helper :campaigns
  include CampaignsHelper
  
  before_filter :verify_mail_module, :except => ['missing_mail_module', 'mail_module_setup']
  before_filter :strip_param_spaces

  cms_admin_paths "mail",
                  'Content' => { :controller => '/content' },
                  'Options' =>   { :controller => '/options' },
                  'Modules' =>  { :controller => '/modules' },
                  'Mail' => { :controller => '/mail_manager' },
                  'Email Campaigns' => { :action => 'index' }

  def verify_mail_module

    if !check_mail_module
      redirect_to :action => :missing_mail_module 
      return false
    elsif ! verify_reply_to_and_address
      redirect_to :action => :mail_module_setup 
      return false
    else
      return true
    end
  end
  
  
  private
  
  def check_mail_module
    SiteVersion.default.site_nodes.find_by_module_name_and_node_type('/mailing/mail','M') ? true : false
  end
  
  def verify_campaign_setup
    if ! @campaign.under_construction?
      redirect_to :action => 'status', :path => @campaign.id
      return false;
    else
      return true
    end
  end
  
  def verify_reply_to_and_address
    ! Configuration.reply_to_email.blank? && ! Configuration.options.company_address.blank?
  end

  public
   
   def view
     campaign_hash = params[:campaign_hash].to_s.gsub(/[^a-fA-F0-9]+/,'')
     queue_hash = params[:queue_hash].to_s.gsub(/[^a-fA-Z0-9]+/,'')
   
    if queue_hash == 'QUEUE'
      @campaign = MarketCampaign.find_by_identifier_hash(campaign_hash) || raise(InvalidPageDataException.new("Invalid Mailing"))
      @under_construction = true
    else
      @campaign = MarketCampaign.find_by_identifier_hash(campaign_hash) || raise(InvalidPageDataException.new("Invalid Mailing"))
      @queue= @campaign.market_campaign_queues.find_by_queue_hash(queue_hash) || raise(InvalidPageDataException.new("Invalid Mailing"))
    
      # Make sure we have a user 
      @user = EndUser.find_target @queue.email, :source => 'website'
      @user.elevate_user_level EndUser::UserLevel::VISITED

      session[:captured_user_info] ||= {}
      session[:captured_user_info][:email] ||= @user.email
      session[:captured_user_info][:name] ||= @user.name

      @campaign.get_handler_instances("mailing","view").each { |h| h.mailing_view(@user) } if @user && !@under_construction

      if !@queue.opened?
	      @queue.reload
	
	      if !@queue.opened?
	        @campaign.reload
	        # Update the number of openings
	        @campaign.stat_opened += 1
	        @campaign.save
	        # and we know this queue entry has opened the mail
	        @queue.opened_at = Time.now
	        @queue.opened = true
	
	        @queue.save
                
	      end
      end
    
    end
    
    mail_template, tracking_variables = @campaign.prepare_mail_template(true)
    
    message = @campaign.market_campaign_message
    mdl = @campaign.data_model_class
    
    if @under_construction
      entry = mdl.find(:first)
      if @campaign.data_model == 'subscription'
        entry = entry.end_user if entry.end_user_id
      end

      vars = message.field_values(entry.attributes,'QUEUE')
      vars.merge!(@campaign.add_tracking_links(tracking_variables,'QUEUE'))
    else
      entry = mdl.find_by_id(@queue.model_id)
      if @campaign.data_model == 'subscription'
        entry = entry.end_user if entry.end_user_id
      end
      
      vars = message.field_values(entry.attributes,@queue.queue_hash)
      vars.merge!(@campaign.add_tracking_links(tracking_variables,@queue.queue_hash))
    end
    
    
    if mail_template.is_html
     render :text => mail_template.render_html(vars), :layout => 'simple'
    else
     render :text => mail_template.render_text(vars), :layout => 'simple'
    end
  end
   
  def link 
    campaign_hash = params[:campaign_hash].to_s.gsub(/[^a-fA-F0-9]+/,'')
    queue_hash = params[:queue_hash].to_s.gsub(/[^a-fA-Z0-9]+/,'')
    link_hash = params[:link_hash].to_s.gsub(/[^a-fA-F0-9]+/,'')


    @tst_msg = "This link was sent in a test message and is no longer valid once a campaign has been sent.".t
    @real_msg = "You have clicked on an invalid link.".t

    begin
        if queue_hash == 'QUEUE'
          @campaign = MarketCampaign.find_by_identifier_hash(campaign_hash) || raise(InvalidPageDataException.new(@real_msg))
          @market_link = @campaign.market_links.find_by_link_hash(link_hash) || raise(InvalidPageDataException.new(@real_msg))
          @under_construction = true
        else
          @campaign = MarketCampaign.find_by_identifier_hash(campaign_hash) || raise(InvalidPageDataException.new(@real_msg))
          @market_link = @campaign.market_links.find_by_link_hash(link_hash) || raise(InvalidPageDataException.new(@real_msg))
          
          @queue= @campaign.market_campaign_queues.find_by_queue_hash(queue_hash) || raise(InvalidPageDataException.new(@real_msg))
          
          # Make sure we have a user 
          @user = EndUser.find_target @queue.email, :source => 'website'


          session[:captured_user_info] ||= {}
          session[:captured_user_info][:email] ||= @user.email
          session[:captured_user_info][:name] ||= @user.name

          # Find or new a market link entry
          @link_entry = @market_link.market_link_entries.find_by_market_campaign_queue_id(@queue.id) || 
                        @market_link.market_link_entries.build(:first_clicked_at => Time.now,
                                                            :market_campaign_queue_id => @queue.id)


          @campaign.get_handler_instances("mailing","link").each { |h| h.mailing_link(@user) } if @user && !@under_construction && @queue.click_count == 0
                                                            
          # increase the click count, set the last clicked_at
          @link_entry.click_count += 1
          @link_entry.last_clicked_at = Time.now()
          @link_entry.save
          
          # This is a unique click on the link
          # if we have only one click on this link entry
          if @link_entry.click_count == 1
            @market_link.unique_clicked += 1
          end
          # Increase the total click count
          @market_link.clicked += 1
          # Save the market link as we are done with updating it's statistics
          @market_link.save # release market link count
          
          # even if we haven't had a tracking image hit yet, 
          # we now know that the queue has been opened
          if !@queue.opened?
            # Update the number of openings
            @campaign.stat_opened += 1
            # and we know this queue entry has opened the mail
            @queue.opened_at = Time.now
            @queue.opened = true
          end
          # update the click count in the queue entry
          @queue.click_count += 1
          
          # Update the campaign if this is the first click from this recipient
          if @queue.click_count == 1
            @campaign.stat_clicked += 1
          end
          
          @campaign.save
          @queue.save
          
          # Save the session id related to this campaign queue
          unless @queue.market_campaign_queue_sessions.find_by_session_id(request.session_options[:id])
            session[:visiting_end_user_id] = @user.id if @user
            @queue.market_campaign_queue_sessions.create(:session_id => request.session_options[:id], :entry_created_at => Time.now)
          end

          session[:from_email_campaign] = true
        end
        
        # redirect to the linked page
        redirect_to @market_link.link_to
    rescue InvalidPageDataException => e
      render :text => e.to_s
    end
      
  end
  
  def image
    begin
    campaign_hash = params[:campaign_hash].to_s.gsub(/[^A-F0-9]+/,'')
    queue_hash = params[:queue_hash].to_s.gsub(/[^A-F0-9]+/,'')

          
    if queue_hash =='QUEUE'
#      @campaign = MarketCampaign.find_by_identifier_hash(campaign_hash) || raise(InvalidPageDataException.new("Invalid Image"))
      render :text => 'This message was sent during campaign preview and is no longer valid'
      return
    else
      @campaign = MarketCampaign.find_by_identifier_hash(campaign_hash) || raise(InvalidPageDataException.new("Invalid Image"))
      @queue= @campaign.market_campaign_queues.find_by_queue_hash(queue_hash) || raise(InvalidPageDataException.new("Invalid Image"))

      if !@queue.opened?
        @user = EndUser.find_target @queue.email, :source => 'website'
        @user.elevate_user_level EndUser::UserLevel::VISITED
        @campaign.get_handler_instances("mailing","view").each { |h| h.mailing_view(@user) } if @user 

	      # Update the number of openings
	      @campaign.stat_opened += 1
	      # and we know this queue entry has opened the mail
	      @queue.opened_at = Time.now
	      @queue.opened = true
      end
      
      @campaign.save
      @queue.save

      send_file "#{RAILS_ROOT}/public/images/spacer.gif", :disposition => 'inline', :type => 'image/gif'
    end
    rescue InvalidPageDataException => e
     render :nothing => true 
    end
  end

  def missing_mail_module
    cms_page_path ['Mail','Email Campaigns'], 'Missing Mail Module'

    if check_mail_module
      redirect_to :action => 'index'
      return
    end
      
    if request.post?
      @site_root = SiteVersion.default.root_node
      @page = @site_root.add_subpage('mail','M')
      @page.update_attributes( :module_name => '/mailing/mail')
      redirect_to :action => 'index'
      return
    end
  end

  def mail_module_setup
    cms_page_path ['Mail','Email Campaigns'], 'Mail Module Setup'

    @options =  Configuration.options(params[:options])
    
    if request.post? && params[:options]
      @options.errors.add(:mailing_contact_email, 'is missing') if @options.mailing_contact_email.blank?
      @options.errors.add(:company_address, 'is missing') if @options.company_address.blank?

      if @options.errors.length == 0 && @options.valid?
	@config = Configuration.retrieve(:options)
	@config.options = @options.to_hash
	@config.save
	redirect_to :action => 'index'
	return
      end
    end
  end

  include ActiveTable::Controller
  active_table :campaign_table,
                MarketCampaign,
                [ hdr(:icon, "",:width => 15),
                  hdr(:string, "name",:label => "Campaign Title"),
                  "Type",
                  "Status",
                  "Emails",
                  "Processed",
                  :created_at,
                  hdr(:date_range, :sent_at, :label => 'When Sent'),
                  "Results"
                ]

  def display_campaign_table(display=true)
    session[:campaigns_show_archived] = params[:archived]=='1' ? true : false if params[:archived]
    @show_archived = session[:campaigns_show_archived]

    if request.post? && params[:table_action]
      case params[:table_action]
      when 'delete'
        delete_campaigns
      when 'archive'
        archive_campaigns
      when 'copy'
        duplicate_campaigns
      when 'pause'
        pause_campaigns
      end
    end

    conditions = session[:campaigns_show_archived] ? '1' : 'archived = 0 '
    @active_table_output  = campaign_table_generate params, :order => 'created_at DESC', :conditions => conditions, :per_page => 20

    render :partial => 'campaign_table' if display
  end

  def index
    cms_page_path ['Mail'], 'Email Campaigns'
    
    page = params[:page] || 1
    
    display_campaign_table(false)
  end
  
  def update_campaigns
    @campaigns = params[:cid].collect do |cid|
      MarketCampaign.find_by_id(cid)
    end.compact
  end
  
  def archive_campaigns
    campaign_action(params[:campaign],"Archived Campaigns: ".t ) do |campaign|
      if !campaign.archived?
        campaign.update_attribute(:archived,true)
        true
      else
        false
      end
    end
  end
  
  def duplicate_campaigns
    campaign_action(params[:campaign],"Duplicated Campaigns: ".t ) do |campaign|
      new_campaign = campaign.clone
      new_campaign.attributes = {
                   :name => campaign.name + " " + "(Copy)".t,
                   :status => "setup",
                   :archived => false,
                   :created_at => Time.now,
                   :stat_queue_size => 0,
                   :stat_skipped => 0,
                   :stat_sent => 0,
                   :stat_bounced_back => 0,
                   :stat_opened => 0,
                   :stat_clicked =>0,
                   :stat_unsubscribe => 0,
                   :stat_abuse => 0,
                   :sent_at => nil,
                   :edited_at => Time.now,
                   :sender_data => {}
                   }
      new_campaign.save
      
      if campaign.market_campaign_message
        new_message = campaign.market_campaign_message.clone
        new_message.market_campaign_id = new_campaign.id
        new_message.save
      end
      
      true
    end
  end
  
  def delete_campaigns
    campaign_action(params[:campaign],"Deleted Campaigns: ".t ) do |campaign|
      campaign.destroy
      true
    end
  end

  def pause_campaigns
    campaign_action(params[:campaign],"Paused Campaigns: ".t ) do |campaign|
      if campaign.status == 'active'
	campaign.status = 'pause'
	campaign.save
	true
      else
	false
      end
    end
  end

  def resend_campaigns
    campaign_action(params[:campaign],"Resent Campaigns: ".t ) do |campaign|
      campaign.resend_campaign
    end
  end

  def campaign
    @everyone = MarketSegment.push_everyone_segment

    opts = Mailing::AdminController.module_options(params[:options])

    if params[:path] && params[:path][0]
      @campaign = MarketCampaign.find(params[:path][0])
      @campaign.sender_type = opts.default_sender if @campaign.sender_type.blank? || !opts.enabled_senders.include?(@campaign.sender_type)
    else
      @campaign = MarketCampaign.new(:created_by => myself, :created_at => Time.now, :sender_type => opts.default_sender)
    end

    if @campaign.id
      return unless verify_campaign_setup
    end

    cms_page_path ['Mail', 'Email Campaigns'], @campaign.id ? 'Edit Campaign' : 'New Campaign'

    @senders = get_handler_options(:mailing,:sender).find_all { |opt| opts.enabled_senders.include?(opt[1]) }

    advanced_options(false)

    if request.post? && params[:campaign]
      @campaign.created_by = myself unless @campaign.id
      @campaign.campaign_type = 'email' unless @campaign.id

      @campaign.sender_data ||= {}
      @campaign.sender_data[:options] = @send_options.to_h if @send_options

      @campaign.edited_at = Time.now
      @campaign.attributes = params[:campaign]

      @campaign.valid?
      @campaign.sender_class.valid?

      if @campaign.market_segment
	@campaign.errors.add(:market_segment_id, 'Target has no members') if @campaign.market_segment.target_count == 0
      else
	@campaign.errors.add(:market_segment_id, 'Target is missing') if @campaign.name
      end

      if @campaign.errors.length == 0 && @campaign.save
        redirect_to :action => 'message', :path => @campaign.id
        return
      end
    end

    segments(false)

    setup_campaign_steps
    @campaign_step =  1
  end

  def advanced_options(display=true)
    if display
      opts = Mailing::AdminController.module_options(params[:options])

      if params[:path] && params[:path][0]
	@campaign = MarketCampaign.find(params[:path][0])
      else
	@campaign = MarketCampaign.new(:created_by => myself, :created_at => Time.now, :sender_type => opts.default_sender)
      end

      @campaign.attributes = params[:campaign] if params[:campaign]
    end

    if @campaign.sender_class.respond_to?('send_options')
      @send_options = @campaign.sender_class.send_options(params[:campaign_options] || (@campaign.sender_data || {})[:options]) 
    end

    render :partial => 'advanced_options' if display
  end

  def segments(display=true)
    @everyone ||= MarketSegment.push_everyone_segment

    @segment = MarketSegment.new(:segment_type => 'subscription')

    if display
      if params[:path] && params[:path][0]
	@campaign = MarketCampaign.find(params[:path][0])
      else
	@campaign = MarketCampaign.new(:created_by => myself, :created_at => Time.now)
      end

      @segment.segment_type = params[:segment_type] if params[:segment_type]
      @campaign.market_segment_id = params[:market_segment_id] if params[:market_segment_id]
    elsif @campaign.market_segment
      @segment.segment_type = @campaign.market_segment.segment_type
      @segment.segment_type = @segment.segment_type == 'everyone' ? 'user_segment' : @segment.segment_type
    end

    @segments = MarketSegment.for_campaign(@campaign).with_segment_type(@segment.segment_type).order_by_name.find(:all)

    if @segment.segment_type == 'user_segment'
      @segments = [@everyone] + @segments
    end

    @segment_types = [['Subscriptions', 'subscription'], ['User Lists', 'user_segment'], ['Special Import', 'content_model']]

    render :partial => 'segments' if display
  end
  
  def delete_segmentation
    market_segment_id = params[:segment_id]
    segment = MarketSegment.find(market_segment_id)
    segment.destroy();
    render :nothing => true
  end

  def segment
    if params[:path] && params[:path][0]
      @campaign = MarketCampaign.find(params[:path][0])
    else
      @campaign = MarketCampaign.new
    end

    @market_segment = MarketSegment.find_by_id(params[:segment_id]) || @campaign.build_market_segment(:segment_type => 'content_model', :market_campaign_id => @campaign.id)

    @options_model = @market_segment.options_model
    if request.post? && params[:segment]
      if params[:segment][:options]
        @options_model = @market_segment.options_model(params[:segment][:options])
        @market_segment.attributes = params[:segment]
        options_valid = @options_model.valid?
        segment_valid = @market_segment.valid?
        @options_model.option_to_i(:content_model_id)

        if segment_valid && options_valid   
	  @options_model.option_to_i(:content_model_id)
          @market_segment.options = @options_model.to_h
          @market_segment.save
          render :action => :segment
	  return
	end
      else
        if @market_segment.update_attributes(params[:segment])
          render :action => :segment
	  return
	end
      end
    end

    if @market_segment.segment_type == 'content_model' &&  @options_model.content_model_id 
      @content_model = ContentModel.find_by_id(@options_model.content_model_id)
      @content_model_fields = @content_model ? @content_model.content_model_fields.collect { |fld| [ fld.name, fld.field ] } : []
    end

    render :partial => 'segment'
  end
  
  def segment_info 
    @segment = MarketSegment.find(params[:segment_id])

    if @segment.user_segment && @segment.user_segment.segment_type == 'filtered' && @segment.user_segment.last_ran_at < 1.day.ago
      @segment.user_segment.refresh
      @refreshing = ! @segment.user_segment.ready?
    end

    render :action => 'segment_info'
  end
  
  def segment_view_list 
    seg = MarketSegment.find(params[:path][0])
    @target_count = seg.target_count
    @target_list  = seg.target_list(:limit => 1000)
    render :action => 'segment_target_list', :layout => 'manage_window'
  end

  def message
    @campaign = MarketCampaign.find(params[:path][0])
    return unless verify_campaign_setup

    unless @campaign.valid_market_segment?
      redirect_to :action => :campaign, :path => [@campaign.id]
      return
    end

    @message = @campaign.market_campaign_message || @campaign.create_market_campaign_message
    
    cms_page_path ['Mail','Email Campaigns'], 'Select Campaign Template'
    
    if request.post?
    
      @message.market_campaign = @campaign
      @message.fields = {}
      (params[:fields] || {}).each do |field_index,field_name|
        @message.fields[field_name.to_s] = params[:values][field_index]
      end
      @message.save
          
      if params[:message]
        if params[:edit] && params[:edit] != '0'

	  mail_template = MailTemplate.find(params[:message])

          if params[:edit] == 'duplicate'
            new_tpl = mail_template.duplicate
            @campaign.mail_template_id = new_tpl.id
          else 
            @campaign.mail_template_id = mail_template.id
          end

          @campaign.edited_at = Time.now
	  @campaign.status = 'created'
	  @campaign.save
	  redirect_to :controller => :mail_manager, :action => :edit_template, :path => [@campaign.mail_template_id], :return => self.class.to_s.underscore, :return_id => @campaign.id
        else
          @campaign.mail_template_id = params[:message]
          @campaign.edited_at = Time.now
	  @campaign.status = 'setup'

	  @campaign.valid?
	  @campaign.sender_class.valid?

	  if @campaign.errors.length == 0
	    @campaign.save
	    redirect_to :action => :confirm, :path => [ @campaign.id ]
	  end
        end
      end
    
    end
    
    @mail_templates = MailTemplate.find(:all, :conditions => 'archived = 0 AND template_type = "campaign" AND subject IS NOT NULL', :order => 'created_at DESC, name')
    
    if @campaign.mail_template
    
      @mail_template = @campaign.mail_template
      prepare_preview
    end
  
    setup_campaign_steps
    @campaign_step =  2
  end

  def validate_link
    status = 200

    begin
      href = params[:href]
      href = Configuration.domain_link(href) unless href =~ /^https?:/
      url = URI.parse(href)
      raise "Invalid Href" unless url.is_a?(URI::HTTP) || url.is_a?(URI::HTTPS)
      Net::HTTP.start(url.host, url.port) do |http|
        http.read_timeout = 4
	http.request_head(url.path) do |response|
	  case response
	  when Net::HTTPSuccess
	    status = 200
	  when Net::HTTPRedirection
	    status = 200
	  else
	    status = 404
	  end
	end
      end
    rescue Timeout::Error, Exception => e
      status = 404
    end

    render :nothing => true, :status => status
  end

  hide_action :prepare_preview
  def prepare_preview(fields = true)
    @target_list = (@campaign.market_segment.target_entries(:limit => 1)||[])
    @target = @target_list[0]

    @message = @campaign.market_campaign_message
    
    generate_field_values
    @links_template = MailTemplate.find_by_id(@mail_template.id)
    
    @from_email = @preview_vars['system:from']
    
    if @preview_vars['system:reply_to']
      @reply_to_email = @preview_vars['system:reply_to']
    end
    
  end
  
  hide_action :generate_field_values
      
  def generate_field_values
    # set a dummy value
    @preview_vars = {}
    @vars = @mail_template.get_variables
    
    @available_fields = @campaign.market_segment.available_fields
    @available_fields_options = [[ '--Select Field--'.t, nil ]] + @available_fields.collect { |fld| [ fld[0], fld[1] ] }
    
    
    @message.fields ||= {}
    # If we don't have any variables, skip this page
    if @vars.length == 0
      return
    end
    
    if(params[:fields])
      params[:fields].each do |field_index,field_name|
	@message.fields[field_name.to_s] = params[:values][field_index].blank? ? nil : params[:values][field_index]
      end
      
    end
    
    
    @vars.collect! do |var|
      val = nil
      
      if @message.fields[var]
        val = @message.fields[var]
      elsif !@message.fields.has_key?(var)
	@available_fields.each do |fld|
  
	if fld[2].include?(var.downcase)
	  val = fld[1]
	  @message.fields[var] = val
	  break
	end
	end
      else
        val = nil
      end
	
       [ var, val ] 
    end
    
    @preview_vars = @message.field_values(@target[1].attributes,'SAMPLE') || {}

    @campaign.add_delivery_variables(@preview_vars)
    
  end
  
  def preview_template
    @campaign = MarketCampaign.find(params[:path][0])
    
    @mail_template = MailTemplate.find(params[:path][1])
    prepare_preview
  end

  def delete_template
    mail_template_id = params[:template_id]
    tpl = MailTemplate.find(mail_template_id )
    tpl.destroy();
    render :nothing => true
  end

  def confirm
    cms_page_path ['Mail','Email Campaigns'], 'Confirm Campaign'
    
    @campaign = MarketCampaign.find(params[:path][0])
    return unless verify_campaign_setup

    unless @campaign.valid_market_segment?
      @campaign.status = 'created'
      @campaign.save
      redirect_to :action => :campaign, :path => [@campaign.id]
      return
    end

    unless @campaign.mail_template
      @campaign.status = 'created'
      @campaign.save
      redirect_to :action => :message, :path => [@campaign.id]
      return
    end

    unless @campaign.sender_class.valid?
      flash[:notice] = @campaign.errors.on_base if @campaign.errors.on_base
      @campaign.status = 'created'
      @campaign.save
      redirect_to :action => :campaign, :path => [@campaign.id]
      return
    end

    generate_sample 
    @from_email = @preview_vars['system:from']

    if @preview_vars['system:reply_to']
      @reply_to_email = @preview_vars['system:reply_to']
    end

    setup_campaign_steps
    @campaign_step =  3
  end
  
  def verify
    @campaign = MarketCampaign.find(params[:path][0])
    return unless verify_campaign_setup

    unless @campaign.valid_market_segment?
      render :update do |page|
        page.redirect_to :action => :campaign, :path => [@campaign.id]
      end
      return
    end

    unless @campaign.mail_template
      render :update do |page|
        page.redirect_to :action => :message, :path => [@campaign.id]
      end
      return
    end

    if request.post? && params[:send_campaign]
      @campaign = MarketCampaign.find(params[:path][0],:lock => true,:conditions => 'status = "setup"')
      if @campaign
        @campaign.status = 'initializing'
        @campaign.edited_at = Time.now
        @campaign.save

        @campaign.run_campaign

        render :update do |page|
          page.redirect_to :action => 'index'
        end
        return
      end
    elsif request.post?
      @not_checked = true
    end

    render :partial => 'verify'
  end

  def resend_campaign
    @campaign = MarketCampaign.find(params[:path][0])
    @campaign.resend_campaign
    redirect_to :action => 'index'
  end

  def send_sample
    @campaign = MarketCampaign.find(params[:path][0])
    generate_sample
    
    sender = @campaign.sender_class
    begin
      sender.send_sample!(params[:email],@mail_template,@preview_vars)
    rescue Net::SMTPSyntaxError => e
      return render :inline => e.to_s
    end

    render :nothing => true
  end
  
  def target_list
    @campaign = MarketCampaign.find(params[:path][0])
    return unless verify_campaign_setup
    
    @target_count = @campaign.market_segment.target_count
    @target_list  = @campaign.market_segment.target_list(:limit => 1000)
    render :action => 'target_list', :layout => 'manage_window'
  end
  
  def update_content_model_options
    @content_model = ContentModel.find_by_id(params[:content_model_id])
    @content_model_fields = @content_model.content_model_fields.collect { |fld| [ fld.name, fld.field ] }
    @options_model = DefaultsHashObject.new
    render :partial => 'segment_edit_content_model_detail'
  end
  
  
  def status
    cms_page_path ['Mail','Email Campaigns'], 'Campaign Status'
  
    @campaign = MarketCampaign.find(params[:path][0])
    if @campaign.under_construction?
      redirect_to :action => 'campaign', :path =>  @campaign.id
    end    
  end
  
  def update_stats
    @campaign = MarketCampaign.find(params[:path][0])
  
    # Send update stats command to a worker
    session[:mailing] ||= {}
    session[:mailing][:worker_key] = @campaign.run_worker(:update_stats)
    
    render :inline => "#{'Updating campaign statistics'.t}<script>setTimeout(CampaignViewer.updateStatsStatus,1500);</script>"
  end
  
  def update_stats_status
    worker =  DomainModel.worker_results(session[:mailing][:worker_key])

    if worker 
      if worker[:processed] == true
        render :inline => "#{'Stats updated. Reloading page.'.t}<script>$('reload_frm').submit();</script>"
      else
        render :inline => "#{'Still updating campaign statistics'.t}<script>setTimeout(CampaignViewer.updateStatsStatus,1500);</script>"
      end
    else
      render :inline => 'Error updating statistics. Please re-try'
    end    
  
  end

  def details
    @detail_type = params[:detail_type]
    
    @download = params[:download]
      
    @campaign = MarketCampaign.find(params[:path][0])
    
    case @detail_type
    when 'unsubscribed':
      @conditions = 'unsubscribed = 1'
    when 'opened':
      @conditions = 'opened = 1'
    when 'bounced':
      @conditions = 'bounced = 1'
    when 'clicked':
      @conditions = 'market_campaign_queues.click_count > 0'
    end
    
    @market_links = @campaign.market_links.index_by(&:id)
    
    @queue_entries = @campaign.market_campaign_queues.find(:all,:conditions => @conditions,:include => :market_link_entries, :limit => @download ? nil : 200)
    
    
    if @download
      handle_download
    else
      render :partial => 'details'
    end
  end

  class MarketCampaignBounceManager < HashModel
    attr_accessor :campaign

    attributes :action => 'unsubscribe'

    validates_presence_of :action

    @@action_options = [['Unsubscribe all bounced users', 'unsubscribe'], ['Delete all bounced users', 'delete']]
    def self.action_options
      @@action_options
    end

    def handle
      case self.action
      when 'unsubscribe'
        self.campaign.run_worker(:unsubscribe_bounces)
      when 'delete'
        self.campaign.run_worker(:delete_bounce_users)
      end
    end
  end

  def bounces
    @campaign = MarketCampaign.find(params[:path][0])
    cms_page_path ['Mail','Email Campaigns', ['Campaign Status', url_for(:action => 'status', :path => @campaign.id)]], 'Bounce Management'

    @bounce_manager = MarketCampaignBounceManager.new params[:bounce]
    @bounce_manager.campaign = @campaign

    if request.post? && params[:bounce]
      @bounce_manager.handle
      flash[:notice] = @bounce_manager.action == 'unsubscribe' ? 'Unsubscribing bounced users'.t : 'Deleting bounced users'.t
      redirect_to :action => 'status', :path => @campaign.id
    end
  end

  private
  
  def campaign_action(campaign_ids,flash_text,&block)
    if request.post? 
      campaign_ids ||= []
      action_list = []
      campaign_ids.each do |campaign_idx,campaign_id|
	campaign = MarketCampaign.find_by_id(campaign_id)
	if campaign
	 if yield(campaign)
	   action_list << campaign.name
	 end
        end
      end
      if action_list.length > 0
	flash.now[:notice] = flash_text + action_list.join(", ")
      end
    end
  end
  
  
  def handle_download
    output = ''
    CSV::Writer.generate(output) do |csv|
  
      case @detail_type
      when 'opened': 
        csv << [ 'Email','Opened At' ]
        @queue_entries.each do |queue|
          csv << [ queue.email, queue.opened_at.localize("%m/%d/%Y %H:%M".t) ]
        end
      when 'clicked':
         csv << [ 'Email','Link','Click Count','Last Click' ]
         @queue_entries.each do |queue|
           queue.market_link_entries.each do |entry|   
            csv << [ queue.email, @market_links[entry.market_link_id].link_to, entry.click_count, entry.last_clicked_at.localize("%m/%d/%Y %H:%M".t) ]
           end
         end
      when 'unsubscribed': 
        csv << ['Email' ]
        @queue_entries.each do  |queue|
          csv << [ queue.email ]
        end
      end
    end
    
    send_data(output,
      :stream => true,
      :type => "text/csv",
	    :disposition => 'attachment',
	    :filename => sprintf("CampaignReport_%s_%s.%s",@campaign.name.gsub(/[^a-zA-Z0-9]+/,""),Time.now.strftime("%Y_%m_%d"),'csv')
	    )
  end
  
  
  def generate_sample
    @campaign = MarketCampaign.find(params[:path][0])
    
    
    @mail_template, tracking_variables = @campaign.prepare_mail_template
    
    @target_list = (@campaign.market_segment.target_entries(:limit => 1)||[])
    @target = @target_list[0]

    @message = @campaign.market_campaign_message
    
    @preview_vars = @message.field_values(@target[1].attributes,'SAMPLE')
    
    
    @preview_vars.merge!(@campaign.add_tracking_links(tracking_variables,'QUEUE'))
    
    @campaign.add_delivery_variables(@preview_vars)
  end

  def strip_param_spaces
    %w(campaign_hash queue_hash link_hash).each do |p|
      params[p].gsub!(' ', '') if params[p]
    end
  end

  public

  def self.mail_template_edit_handler_info
    {
      :name => 'Campaigns Controller',
      :partial => '/campaigns/mail_template_edit',
      :template_type => 'campaign'
    }
  end

  def self.mail_template_cms_path(controller)
    [[ "Mail", ['Email Campaigns', controller.url_for(:controller => 'campaigns', :action => 'index')]], "Edit Mail Template"]
  end

  def self.mail_template_save(mail_template, controller)
    campaign = MarketCampaign.find(controller.params[:return_id])
    campaign.sender_class.valid?
    if campaign.errors.length > 0
      mail_template.errors.add_to_base campaign.errors.on_base
      return nil
    end

    if campaign.under_construction?
      campaign.update_attributes(:mail_template_id => mail_template.id, :status => 'created')
      controller.url_for(:controller => 'campaigns', :action => 'message', :path => [campaign.id])
    else
      controller.url_for(:controller => 'campaigns', :action => 'index')
    end
  end
end
