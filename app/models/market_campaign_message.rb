class MarketCampaignMessage < DomainModel

  belongs_to :market_campaign
  
  serialize :message_body
  serialize :fields
  
  def get_mail_module_path
      if !@mail_module_path
      mm = SiteNode.find_by_module_name('/mailing/mail')
      if mm 
        @mail_module_path = 'http://' + Configuration.full_domain + mm.node_path
      end
    end
    return @mail_module_path if @mail_module_path 
    nil
  end
  # Generate a 
  def field_values(attr,queue_hash)
    
    vals = {}
    
    (self.fields||{}).each do |field,variable|
      # If we have an attribute by that name,
      # just set it
      if attr[variable]
        vals[field] = attr[variable]
      else
        case variable
        when 'introduction':
            vals[field] = attr['gender'] == 'f' ? "Mrs.".t : "Mr.".t 
        when 'name':
            name = []; 
            name << attr['first_name'] if attr['first_name']
            name << attr['last_name'] if attr['last_name']
            vals[field] = name.join(' ')
        when 'first_name_friend':
            if attr['first_name'].blank?
                vals[field] =  "Friend"
            else
                vals[field] =  attr['first_name']
            end
        when 'unsubscribe':
            vals[field] = "<a href='#{get_mail_module_path}/unsubscribe/#{self.market_campaign.identifier_hash}/#{queue_hash}'>#{'Unsubscribe'.t}</a>"
        when 'unsubscribe_href'
            vals[field] = "#{get_mail_module_path}/unsubscribe/#{self.market_campaign.identifier_hash}/#{queue_hash}"
        when 'view_online':
            vals[field] = "<a href='http://" + Configuration.full_domain +  "/mailing/view/#{self.market_campaign.identifier_hash}/#{queue_hash}'>#{'View Online'.t}</a>"
        when 'view_online_href':
            vals[field] = 'http://' + Configuration.full_domain +  "/mailing/view/#{self.market_campaign.identifier_hash}/#{queue_hash}"
        end
      end
    end
    
    vals
  end
end
