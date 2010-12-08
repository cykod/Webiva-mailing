class Mailing::AdminController < ModuleController

  permit 'mailing_mail_config'

  component_info 'Mailing', :description => 'Emailing Campaigns Component', 
                              :access => :private
  register_permission_category :mailing, "Mailing" ,"Permissions for Mailing Campaigns"
  register_permissions :mailing, [  [ :mailing, 'Send Email Campaigns', 'Manage Email Campaigns' ], [ :mail_config, 'Configure Email Campaign', 'Configure Email Campaigns'] ]

  module_for :mail, 'Mail', :description => 'Add E-Marketing Pages to your site'
  
  user_actions :mail
  
  register_handler :members, :view,  "Mailing::ReportsController"
  
  register_handler :mailing, :sender, "Mailing::WebivaSender"
  register_handler :mailing, :receiver, "Mailing::WebivaReceiver"
  register_handler :mailing, :sender, "Mailing::VerticalResponseSender"
  register_handler :mailing, :sender, "Mailing::SendGridSender"
  
  register_handler :navigation, :mail, "Mailing::AdminController"
  
  register_handler :mail_template, :edit, 'CampaignsController'

  register_handler :user_segment, :fields, 'MarketCampaignQueueSegmentField'

  cms_admin_paths "options",
                  'Content' => { :controller => '/content' },
                  'Options' =>   { :controller => '/options' },
                  'Modules' =>  { :controller => '/modules' },
                  'Mailing Module Options' => { :action => 'options' }
  
  def self.navigation_mail_handler_info
    {:name => 'Mail Pages', 
     :pages => 
        [ [ "Email Campaigns", :mailing_mailing, "mail_campaigns.png", {  :controller => '/campaigns', :action => 'index' },
         "Create and Review E-mail Marketing Campaigns" ]
        ]
    }
  end
  
  
  def mail
    @node = SiteNode.find_by_id_and_module_name(params[:path][0],'/mailing/mail')
  
    @page_modifier = @node.page_modifier 
    @options = DefaultsHashObject.new(params[:options] || @page_modifier.modifier_data)
    
    @options[:unsubscribe_text] ||=  Mailing::MailRenderer::DEFAULT_UNSUBSCRIBE_TEXT.t
    @options[:unsubscribed_text] ||= Mailing::MailRenderer::DEFAULT_UNSUBSCRIBED_TEXT.t
    
    if request.post? 
       @page_modifier.modifier_data = @options.to_h
       if @page_modifier.save
        @saved = true
       end
    end
    
    render :action => 'mail', :layout => false
  end
  
  def options
    cms_page_path ['Options','Modules'], 'Mailing Module Options'
    

    @handlers = get_handler_info(:mailing,:sender,nil,true)

    # Update blank secure_options with existing values
    if params[:options] && params[:options][:senders]
      senders = params[:options][:senders]
      @options = self.class.module_options
      @handlers.each do |handler|
        next unless handler[:secure_options]
        sender = senders[handler[:identifier]]

        handler[:secure_options].each do |fld|
          if sender[fld].blank? && @options.senders[handler[:identifier]]
            sender[fld] = @options.senders[handler[:identifier]][fld]
          end
        end
      end
    end

    @options = self.class.module_options(params[:options])
    
    # Get each of the handler option models
    @handlers.each do |handler|
      if handler[:options_partial]
        handler[:opts] = handler[:class].options(@options.senders[handler[:identifier]])
      end
    end
    
    
    if request.post? && params[:options] && @options.valid?
      ok = true
      @options.enabled_senders.each do |sender|
        handler = @handlers.detect() { |hndl| hndl[:identifier] == sender }
        if handler && handler[:options_partial]
          if handler[:opts].valid?
            @options.senders[handler[:identifier]] = handler[:opts].to_h
          else
            ok = false
          end
        end
      end
      if ok
        Configuration.set_config_model(@options)
        flash[:notice] = "Updated mailing options".t 
        redirect_to :controller => '/modules'
        return
      end
    end

    # Clear all secure options before displaying the form
    @handlers.each do |handler|
      if handler && handler[:options_partial] && handler[:secure_options]
        handler[:secure_options].each { |fld| handler[:opts].send("#{fld}=", nil) }
      end
    end

    @senders = get_handler_options(:mailing,:sender,true)
  end
  
  def self.module_options(vals=nil)
    Configuration.get_config_model(ModuleOptions,vals)
  end

  class ModuleOptions < HashModel
    attributes :enabled_senders => [ 'mailing/webiva_sender'], :default_sender => 'mailing/webiva_sender', :senders => {}

    def validate
      enabled_senders = self.enabled_senders.find_all { |elm| !elm.blank? }
      if enabled_senders.length == 0
	errors.add(:enabled_senders,'must include at least one valid sender')
      end
        
      if !enabled_senders.include?(default_sender)
	errors.add(:default_sender,'must be an enabled sender')
      end
    end
  end             
end
