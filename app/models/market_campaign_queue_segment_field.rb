
class MarketCampaignQueueSegmentField < UserSegment::FieldHandler

  def self.user_segment_fields_handler_info
    {
      :name => 'Campaign Fields',
      :domain_model_class => MarketCampaignQueue,
      :end_user_field => :model_id
    }
  end

  class MarketCampaignType < UserSegment::FieldType
    def self.select_options
      MarketCampaign.find(:all, :select => 'name, id', :conditions => {:status => 'completed'}).collect { |c| [c.name, c.id] }.sort { |a,b| a[0] <=> b[0] }
    end

    register_operation :is, [['Campaign', :model, {:class => MarketCampaignQueueSegmentField::MarketCampaignType}], ['Status', :option, {:options =>[['Sent', 'sent'], ['Opened', 'opened']]}]]

    def self.is(cls, group_field, field, id, status)
      case status
      when 'sent'
        cls.scoped(:conditions => ["#{field} = ? and sent = 1", id])
      when 'opened'
        cls.scoped(:conditions => ["#{field} = ? and opened = 1", id])
      end
    end
  end

  register_field :emails_sent, UserSegment::CoreType::CountType, :field => :model_id, :name => '# Emails Sent', :display_method => 'count', :sort_method => 'count', :sortable => true, :scope => {:conditions => {:sent => true}}
  register_field :emails_opened, UserSegment::CoreType::CountType, :field => :model_id, :name => '# Emails Opened', :display_method => 'count', :sort_method => 'count', :sortable => true, :scope => {:conditions => {:opened => true}}
  register_field :emails_bounced, UserSegment::CoreType::CountType, :field => :model_id, :name => '# Emails Bounced', :display_method => 'count', :sort_method => 'count', :sortable => true, :scope => {:conditions => {:bounced => true}}
  register_field :emails_abuse, UserSegment::CoreType::CountType, :field => :model_id, :name => '# Emails Abuse', :display_method => 'count', :sort_method => 'count', :sortable => true, :scope => {:conditions => {:abuse => true}}
  register_field :emails_skip, UserSegment::CoreType::CountType, :field => :model_id, :name => '# Emails Skip', :display_method => 'count', :sort_method => 'count', :sortable => true, :scope => {:conditions => {:skip => true}}
  register_field :emails_unsubscribed, UserSegment::CoreType::CountType, :field => :model_id, :name => '# Emails Unsubscribed', :display_method => 'count', :sort_method => 'count', :sortable => true, :scope => {:conditions => {:unsubscribed => true}}

  register_field :campaign, MarketCampaignType, :field => :market_campaign_id, :name => 'Campaign'

  def self.sort_scope(order_by, direction)
     info = UserSegment::FieldHandler.sortable_fields[order_by.to_sym]

    if order_by.to_sym == :emails_sent
      sort_method = info[:sort_method]
      field = info[:field]
      MarketCampaignQueue.scoped(:select => "model_id, #{sort_method}(#{field}) as #{field}_#{sort_method}", :group => :model_id, :order => "#{field}_#{sort_method} #{direction}")
    else
      field = self.user_segment_fields[order_by.to_sym][:field]
      MarketCampaignQueue.scoped :order => "#{field} #{direction}"
    end
  end

  def self.field_heading(field)
    self.user_segment_fields[field][:name]
  end

  def self.get_handler_data(ids, fields)
    MarketCampaignQueue.find(:all, :conditions => {:model_id => ids}).group_by(&:model_id)
  end

  def self.field_output(user, handler_data, field)
    UserSegment::FieldType.field_output(user, handler_data, field)
  end
end
