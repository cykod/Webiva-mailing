
class MarketCampaignQueueSegmentField < UserSegment::FieldHandler

  def self.user_segment_fields_handler_info
    {
      :name => 'Campaign Fields',
      :domain_model_class => MarketCampaignQueue,
      :end_user_field => :model_id
    }
  end

  @@email_states = %w(sent bounced unsubscribed abuse opened skip)
  def self.email_states; @@email_states; end
  def self.email_states_options; self.email_states.collect{|s| [s.titleize, s]}; end

  class MarketCampaignType < UserSegment::FieldType
    def self.select_options
      MarketCampaign.find(:all, :select => 'name, id', :conditions => {:status => 'completed'}).collect { |c| [c.name, c.id] }.sort { |a,b| a[0] <=> b[0] }
    end

    register_operation :is, [['Campaign', :model, {:class => MarketCampaignQueueSegmentField::MarketCampaignType}], ['Status', :option, {:options => MarketCampaignQueueSegmentField.email_states_options}]]

    def self.is(cls, group_field, field, id, status)
      if MarketCampaignQueueSegmentField.email_states.include?(status)
        cls.scoped(:conditions => ["#{field} = ? and #{status} = 1", id])
      else
        cls.scoped(:conditions => ["#{field} = ?", id])
      end
    end
  end

  @@email_states.each do |state|
    register_field "emails_#{state}".to_sym, UserSegment::CoreType::CountType, :field => :model_id, :name => "# Emails #{state}".titleize, :display_method => :count_valid_states, :sort_method => 'sum', :sortable => true, :scope => {:conditions => {state.to_sym => true}}, :display_field => state.to_sym
  end

  register_field :campaign, MarketCampaignType, :field => :market_campaign_id, :name => 'Campaign', :display_field => :market_campaign_name
  register_field :email_sent_at, UserSegment::CoreType::DateTimeType, :field => :sent_at, :name => 'Email Sent At', :display_method => 'max'
  register_field :email_opened_at, UserSegment::CoreType::DateTimeType, :field => :opened_at, :name => 'Email Opened At', :display_method => 'max'

  def self.sort_scope(order_by, direction)
     info = UserSegment::FieldHandler.sortable_fields[order_by.to_sym]

    if info[:type] == UserSegment::CoreType::CountType
      sort_method = info[:sort_method]
      field = info[:display_field]
      MarketCampaignQueue.scoped(:select => "model_id, #{sort_method}(#{field}) as #{field}_#{sort_method}", :group => :model_id, :order => "#{field}_#{sort_method} #{direction}")
    else
      field = self.user_segment_fields[order_by.to_sym][:field]
      MarketCampaignQueue.scoped :order => "#{field} #{direction}"
    end
  end

  def self.field_heading(field)
    self.user_segment_fields[field][:name]
  end

  def self.count_valid_states(values)
    values.delete_if{ |v| v == false }.size
  end

  def self.get_handler_data(ids, fields)
    MarketCampaignQueue.find(:all, :conditions => {:model_id => ids}, :include => :market_campaign).collect do |queue|
      MarketCampaignQueueSegmentField.email_states do |state|
        queue.send("#{state}=", nil) if queue.send(state).blank?
      end
      queue
    end.group_by(&:model_id)
  end

  def self.field_output(user, handler_data, field)
    UserSegment::FieldType.field_output(user, handler_data, field)
  end
end
