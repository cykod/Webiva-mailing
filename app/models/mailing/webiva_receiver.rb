
class Mailing::WebivaReceiver
  cattr_accessor :logger
  @@logger = ActiveRecord::Base.logger

  def self.mailing_receiver_handler_info
    { :name => 'Webiva Receiver'
    }
  end   

  def self.receive(email)
    return unless email.content_type == 'multipart/report'

    status_part = email.parts.detect do |part|
      part.content_type == 'message/delivery-status'
    end

    return unless status_part

    status_code = nil
    status_part.body.split(/\n/).each do |line|
      key, value = line.split(/:/)
      next unless key == 'Status'
      status_code = value.strip
      break;
    end

    return unless status_code

    status_message = nil
    case status_code
    when /^5/
      status_message = 'Failure'
    when /^4/
      status_message = 'Temporary Failure'
    when /^2/
      status_message = 'Success'
    end

    return unless status_message == 'Failure'

    original_message_part = email.parts.detect do |part|
      part.content_type == 'message/rfc822'
    end

    return unless original_message_part

    parsed_msg = TMail::Mail.parse(original_message_part.body)

    webiva_message_id = (parsed_msg.header['x-webiva-message-id'] || '').to_s
    return unless webiva_message_id

    campaign_identifier_hash, queue_hash = webiva_message_id.split(/\//)
    return unless campaign_identifier_hash && queue_hash

    campaign = MarketCampaign.find_by_identifier_hash(campaign_identifier_hash)
    unless campaign
      logger.warn("invalid identifier_hash(#{campaign_identifier_hash}) for campaign")
      return
    end

    queue = campaign.market_campaign_queues.find_by_queue_hash(queue_hash)
    if queue
      queue.bounced = true
      queue.save
      campaign.stat_bounced_back = campaign.market_campaign_queues.count(:conditions => {:bounced => true})
      campaign.save
    else
      logger.warn("Received a bounce for campaign:#{campaign.name}(#{campaign.id}) to: #{parsed_msg.to} with but no campaign market queue was found for #{queue_hash}.")
    end
  end
end
  
