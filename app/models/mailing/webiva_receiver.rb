
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

    original_message_part = email.parts.detect do |part|
      part.content_type == 'message/rfc822'
    end

    return unless original_message_part

    parsed_msg = TMail::Mail.parse(original_message_part.body)

    logger.warn("#{parsed_msg.message_id} status:#{status_message} #{status_code}")
  end
end
  
