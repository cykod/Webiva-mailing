# Copyright (C) 2009 Pascal Rettig.

module CampaignsHelper

  def message_excerpt(seg)
    msg = 'Subject: '.t + seg.subject + '<br/>'
    msg += 'Message: '.t 
    msg += truncate(seg.body_type.include?('text') ?  seg.body_text : seg.body_html.gsub(/<\/?[^>]*>/, ""),60)
      
    msg
  end
  
 def setup_campaign_steps
    if !@campaign.id 
      @campaign_max_step = 1
    elsif @campaign.status != 'setup'
      @campaign_max_step = 2
    else
      @campaign_max_step = 3
    end
      
  end
    
end
