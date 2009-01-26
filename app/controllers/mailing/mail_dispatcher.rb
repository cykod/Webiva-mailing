
class Mailing::MailDispatcher < ModuleDispatcher
  

  available_pages ['/verify', 'verify', 'Verify Subscription', 'Verify Subscription',false],
                  ['/unsubscribe', 'unsubscribe', 'Unsubscribe', 'Unsubscribe',false]
                  
                  
  
  
  def verify(args)
    simple_dispatch(1,'mailing/mail','verify', :connections => { :input => [ :confirmation_hash, args[0] ] } ) 
  end

  def unsubscribe(args)
    simple_dispatch(1,'mailing/mail','unsubscribe', :connections => { :campaign_hash => [ :campaign_hash, args[0] ], 
                                                              :queue_hash => [ :queue_hash, args[1] ] } )
    
  end
  
end
