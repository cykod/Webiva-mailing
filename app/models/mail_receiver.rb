require 'mime/types'

class MailReceiver < ActionMailer::Base


  def receive(email)
     File.open("/home/pascal/projects/work/webiva/log/output.txt",'a') do |f|
      f.write("#{RAILS_ROOT}");
      f.write([email.to, email.subject, email.message_id, email.body].inspect + "\n")
     end
     
     # Check the domain of the receiver 
     
     # Activate the correct domain DB
     # From the recipient
     
     
     # find a queue hash with the correct message id
     # mark the mail as bounced
     
     
  end

end
