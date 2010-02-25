require 'csv'
require 'base64'
require 'VRAPI/VRAPIDriver.rb'

class Mailing::VerticalResponseSender
  
  SENDING_WINDOW_SIZE = 250
  
  def initialize(campaign,options)
    @campaign = campaign
    @options = options
    @sender_data = campaign.sender_data || {}
  end
  
    
  def self.mailing_sender_handler_info
    { :name => 'Vertical Response Mailer',
      :options_partial => '/mailing/senders/vr_options.rhtml'
    }
  end
  
  def self.options(hsh)
    Options.new(hsh)
  end
  
  class Options < HashModel
    default_options :login => nil, :access_pw => nil, :skip_launch => 'no'
    
    validates_presence_of :login, :access_pw
  end
  
  
  def login
   @vr = VRAPI::VRAPIPortType.new
   
   if @sender_data[:vr_session] && @sender_data[:vr_session_expire].to_i > Time.now.to_i
      @sid = @campaign.sender_data[:vr_session]
   else
     @sid = @vr.login(
                 {
                     'username' => @options.login,
                     'password' => @options.access_pw,
                     'session_duration_minutes' => 10
                   }
                   )
     return unless @sid
     @sender_data[:vr_session] = @sid
     @sender_data[:vr_session_expire] = (Time.now + 10.minutes).to_i
   end
  end
  
  def generate_campaign(mail_template)
    return @sender_data[:cid] if @sender_data[:cid]
    
    email_campaign = {
            'name' => (@campaign.name + " " + Time.now.strftime("%m/%d/%Y %H%M"))[0..38],
            'type' => mail_template.is_html ? 'freeform' : 'freeform_text',
            'from_label' => '',
            'send_friend' => @options.send_friend == 'yes' ? true : false,
            'redirect_url' => "http://" + Configuration.full_domain }
    @sender_data[:cid] = @vr.createEmailCampaign({
                                 'session_id' => @sid,
                                 'email_campaign' => email_campaign                
                               })   
     save_campaign_data!
     @sender_data[:cid]
  end
  
  def save_campaign_data!
    @campaign.reload(:lock => true)
    @campaign.update_attribute(:sender_data,@sender_data)
  end
  
  def set_campaign_contents(mail_template,vars)
    content_fields = [ [ 'subject', mail_template.render_subject(vars) ],
               [ 'unsub_message', mail_template.unsubscribe_text ],
               [ 'postal_address', Configuration.options.company_address ]  ]

    if mail_template.is_html
        content_fields << [ 'freeform_html', mail_template.render_html(vars) ]
    end
    if mail_template.is_text
        content_fields << [ 'freeform_text', mail_template.render_text(vars) ]
    end
               
         
    content_fields.each do |fld|
      @vr.setEmailCampaignContent({ 
                'session_id' => @sid,
                'campaign_id' => @cid,
                'content' => {
                  'type' => fld[0],
                  'copy' => fld[1]
                  }
                })
    end
    
    atr_fields = [ [ 'from_label', vars['system:from_name'] ],
                   [ 'name', @campaign.name ]]
                   
    if @sender_data[:options] && @sender_data[:options][:send_on]
      begin
        send_on = Time.parse_datetime(@sender_data[:options][:send_on]).getgm
        atr_fields << [ 'mail_date',send_on ]
      rescue Exception => e
        nil
      end
    end
                   
    atr_fields.each do |fld|
      @vr.setEmailCampaignAttribute({ 
              'session_id' => @sid,
              'campaign_id' => @cid,
              'name' => fld[0],
              'value' => fld[1] })
    end              
  end
  
  def prepare_mail_template(mail_template,online)
  
    mail_template.replace_image_sources
    tracking_variables = []
    
    mail_template.replace_link_hrefs
    
    mail_template.prepare_template
        
    return mail_template, tracking_variables  
  end  
  

  def send!(mail_template,message,vars)
    return false unless login
    vars = {}
    @cid = generate_campaign(mail_template)
    

    merge_fields = []
    @campaign.add_delivery_variables(vars)
    (message.fields||{}).each do |fld_orig,val|
      fld = 'CUSTOM_' + fld_orig.upcase
      vars[fld_orig] = "{#{fld}}"
      merge_fields << [ fld, fld_orig ]
    end
    set_campaign_contents(mail_template,vars)
     
    @campaign.reload
    # If the campaign has been paused or otherwise interrupted
    if @campaign.status != 'active'
      return
    end
        
    

    
    
    @lid = @vr.createList({
                      'session_id' => @sid,
                      'name' => ("LIST:" +@campaign.name + " " + Time.now.strftime("%m/%d/%Y %H%M"))[0..38],
                      'type' => 'email',
                      'custom_field_names' => merge_fields.collect { |fld| fld[0] }
                  })

        
    queues = @campaign.market_campaign_queues.find(:all,:conditions => 'handled=0',:limit => SENDING_WINDOW_SIZE)
    entry_offset = 0
    
    # If we're done
    # Update status to completed
    if queues.length == 0
      @campaign.reload(:lock => true)
      @campaign.status='completed'
      @campaign.save
      return
    end

    while queues.length > 0
      @campaign.reload
      # If the campaign has been paused or otherwise interrupted
      if @campaign.status != 'active'
        return
      end
          

      skip_count = 0
      sent_count = 0

      case @campaign.data_model
      when 'subscription':
       mdl = UserSubscriptionEntry
      when 'members':
       mdl = EndUser
      else
       mdl = ContentModel.find(@campaign.data_model).content_model
      end
      
      target_buf = ''

      queues.each do |queue|

        skip_target = UserUnsubscription.find_by_email(queue.email) ? true : false
        
        if skip_target
          skip_count += 1
        else
          entry = mdl.find_by_id(queue.model_id)
          if @campaign.data_model == 'subscription'
           entry = entry.end_user if entry.end_user_id
          end
          
          vars = message.field_values(entry.attributes,'QUEUE')
          
          target = [ queue.email ] + merge_fields.collect { |fld| vars[fld[1]].blank? ? nil : vars[fld[1]].to_s }
          
          CSV.generate_row(target,target.length,target_buf,"\t","\n")

          queue.sent_at = Time.now
          queue.sent = true
          sent_count += 1
        end
        
        queue.handled = true
        queue.save
      
      end             

      
      # Help the garbage collecting if we can
      queues = nil
      @campaign.reload(:lock => true)
      @campaign.stat_sent += sent_count
      @campaign.stat_skipped +=  skip_count

      @campaign.save
      
      output = @vr.appendFileToList( {
        'session_id' => @sid,
        'list_id' => @lid,
        'file' => {
          'filename' => @campaign.id.to_s + "_" + entry_offset.to_s + "_list.csv",
          'delimiter' => 'tab',
          'contents' => target_buf
        },
        'fields' => [ 'email_address'] + merge_fields.collect { |fld| fld[0] }
        
        })	      

      # Go to sleep for a second to let everything catch up
      sleep(2)

      entry_offset += SENDING_WINDOW_SIZE
      queues = @campaign.market_campaign_queues.find(:all,:conditions => 'handled=0',:limit => SENDING_WINDOW_SIZE)
    end 

    
    @vr.setCampaignLists({ 'session_id' => @sid, 'campaign_id' => @cid, 'list_ids' => [@lid] })
    
    if @options.skip_launch != 'yes'
      @vr.launchEmailCampaign({ 'session_id' => @sid, 'campaign_id' => @cid })
    end

    # Help the garbage collecting if we can
    queues = nil
    @campaign.reload(:lock => true)
#    @campaign.stat_sent += sent_count
#    @campaign.stat_skipped +=  skip_count
    @campaign.status='completed'

    @campaign.save
   
     
    save_campaign_data!
  end          
  
  
  def update_stats
    return false unless login
    @cid = @sender_data[:cid]
    
    
    begin
       results = @vr.getEmailCampaignStats( { 'session_id' => @sid, 'campaign_id' => @cid } )
      
       fl  = @vr.downloadCampaignRecipientResults( { 'session_id' => @sid, 'campaign_id' => @cid, 'delimiter' => 'csv', 'fields_to_include' => [ 'email_address' ]  } )
       uri = URI.parse(fl.contents.location)
       
       http = Net::HTTP.new(uri.host)
       data = http.get(uri.path)
       csv = CSV.parse(data.body)
       
       titles = csv.shift
       title_hash  = {}
       titles.each_with_index { |itm,idx| title_hash[itm] = idx }
       
       email_field = title_hash['Email Address']
       response_type_field = title_hash['Response Type']
       response_date_field = title_hash['Response Date']
       link_field = title_hash['Click URL']
       
       last_response = nil
       while(row = csv.shift) do 
        next unless row[response_date_field]
        response_date = Time.parse(row[response_date_field])
        # Skip this entry unless it's new or this is our first pass through the sttas
        next unless !@campaign.stats_updated_at || response_date > @campaign.stats_updated_at
  
        response_type = row[response_type_field]
        next if response_type == 'NONE' # Nothing to do if NONE
        
        last_response = response_date if !last_response || last_response < response_date
        response_email = row[email_field]
        
        
        queue = @campaign.market_campaign_queues.find_by_email(response_email,:lock => true)
        next unless queue
        
        case response_type.upcase
        when 'OPEN':
          queue.update_attributes(:opened => 1, :opened_at => response_date)
          
        when 'CLICK':
          queue.update_attributes(:click_count => queue.click_count + 1 )
          link = @campaign.market_links.find_by_link_to(row[link_field],:lock => true)
          if link
            link.update_attributes(:clicked => link.clicked + 1,:unique_clicked => link.unique_clicked + 1)
          else
            link = @campaign.market_links.create(:link_to => row[link_field], :clicked => 1, :unique_clicked => 1)
          end
          
          link.market_link_entries.create(:market_campaign_queue_id => queue.id, :click_count => 1, 
                                          :first_clicked_at => response_date,
                                          :last_clicked_at => response_date)
            
        when 'BOUNCE':
          queue.update_attributes(:bounced => 1)
        when 'UNSUBSCRIBE':
          queue.update_attributes(:unsubscribed => 1)
          UserUnsubscription.create(:email => response_email, :unsubscription_type => 'Vertical Response',
                                   :reason => "Campaign #{@campaign.id}: @campaign.name",
                                   :unsubscribed_at => response_date) # validates uniqueness of email - so there won't be duplicated entries
        end        
       end
       
       last_response ||= Time.now
       
        #<VRAPI::EmailCampaignStats:0x7fdd5c74abd0 @campaign_name="API Test Campaign #5", @emails_sent=2, @campaign_id=1492025, @unsub_count=0, @click_count=1, @bounce_count=0, @reopen_count=0, @sent_date=Mon, 05 May 2008 02:14:00 +0000, @purchase_total=nil, @campaign_type="freeform", @open_count=0, @status="sent", @sale_count=nil>
       @campaign.reload(:lock => true)
       @campaign.update_attributes(
            :stat_sent => results.emails_sent,
            :stat_bounced_back => results.bounce_count,
            :stat_opened => results.open_count,
            :stat_clicked => results.click_count,
            :stat_unsubscribe => results.unsub_count,
            :stats_updated_at => last_response,
            :stats_downloaded_at => Time.now
          )
        return true       
    rescue Exception => e
      raise e
    end
  end
  
  def send_sample!(email,mail_template,vars)
    return false unless login
    @cid = generate_campaign(mail_template)
    
    original_vars = vars.clone
    
    message = @campaign.market_campaign_message
    
    merge_fields = []
    (message.fields||{}).each do |fld_orig,val|
      fld = 'CUSTOM_' + fld_orig.upcase
      vars[fld_orig] = "{#{fld}}"
      merge_fields << [ fld, fld_orig ]
    end    
  
    set_campaign_contents(mail_template,vars)
    
    user = [{  'name' => 'email_address',
               'value' => email
            }]
            
    merge_fields.collect do |fld| 
      user << { 'name' => fld[0],
                'value' => original_vars[fld[1]] }
    end
    
    test_list = [user]
  
    @response = @vr.sendEmailCampaignTest({
                                     'session_id' => @sid,
                                     'campaign_id' => @cid,
                                     'recipients' => test_list,
                                   })
    
    save_campaign_data!
    
  end  
  
  def send_options(opts = nil)
    opts ||= {}
    
    SendOptions.new(opts)
  end
  
  class SendOptions < HashModel
    default_options :send_on => nil
    
    validates_datetime :send_on, :allow_nil => true
  
    def validate

      begin
        if !self.send_on.blank? &&  self.send_on.to_time < Time.now
          errors.add(:send_on,'must be a time in the future')
        end
      rescue
        errors.add(:send_on,'must be a time in the future')
      end
        
    end
  end
  
  def send_options_partial; '/mailing/senders/vr_send_options'; end
  
  def options_description
    txt = ''
    begin
      if @sender_data[:options] && !@sender_data[:options][:send_on].blank?
        txt += 'Send '.t + Time.parse_datetime(@sender_data[:options][:send_on]).strftime(DEFAULT_DATETIME_FORMAT.t)
        
      else
        txt += 'Send Immediately'.t
      end
    rescue
      txt = 'Send Immediately'
    end
    txt
  end
end
  
