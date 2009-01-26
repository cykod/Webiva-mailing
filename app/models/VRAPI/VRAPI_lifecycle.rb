#!/usr/local/bin/ruby   

require 'VRAPIDriver.rb'
require 'login.rb'

vr = VRAPIPortType.new
file_html = 'message_content.html'
html = File.new(file_html, "r")
file_text = 'message_content.txt'
text = File.new(file_text, "r")
subject = "Testing: " + $username +  DateTime.now.to_s




begin

  print "Login into: " + $username + " ...\n"
  sid = vr.login(
               {
                   'username' => $username,
                   'password' => $pass,
                   'session_duration_minutes' => $ses_time,
                 }
                 )
  
  
  #creates a new list and provides a List ID (lid)
  print "Creating list...\n"
  lid = vr.createList({
                        'session_id' => sid,
                        'name' => "Mailing List: " + DateTime.now.to_s,
                      'type' => 'email'
                      })
  print "Setting up Member Data for list...\n"
  member_data = [
                 {
                   'name' => 'email_address',
                   'value' => 'api-support@verticalresponse.com',               
                 },
                 {
                   'name' => 'First_Name',
                   'value' => 'Allen',                
                 },
                 {
                   'name' => 'Last_Name',
                   'value' => 'Corona',
                 }
                ]

  print "Adding member record to the list...\n"
  member_record  = vr.addListMember({
                                      'session_id' => sid,
                                      'list_member' =>{
                                        'list_id' => lid,
                                        'member_data' => member_data,                                
                                      }
                                    })
  
  #lets go ahead and create a campaign
  email_campaign = {
    'name' => "Camp." +  DateTime.now.to_s,
    'type' => "freeform",
    'from_label' => "XYZ_newsletter",
    'support_email' => $username,
    'send_friend' => true,
    'redirect_url' => "http://www.verticalresponse.com",
    'contents' => [
                   {
                     'type' => 'freeform_html', 
                     'copy' => html.read
                   },
                   {
                     'type' => 'freeform_text',
                     'copy' => text.read
                   },
                   {
                     'type' => 'subject',
                     'copy' => subject
                   },
                   {
                     'type' => 'unsub_message',
                     'copy' => "You requested these emails, now you want to leave? If so ",
                     
                   }                                              
                  ],    
  }
  
  #sending request to the VR
  print "Creating message...\n"
  cid = vr.createEmailCampaign({
                                 'session_id' => sid,
                                 'email_campaign' => email_campaign,                  
                               })
  #sending Test message
  
  test_list = [
               [{
                  'name' => 'email_address',
                  'value' => $username
                },
                {
                  'name' => 'First_Name',
                  'value' => 'VR_User'
                }
               ],
               [{
                  'name' => 'email_address',
                  'value' => 'api-support@verticalresponse.com'
                },
                {
                  'name' => 'First_Name',
                  'value' => $username
                }
               ]
              ]
  print "Sending test message...\n"
  temp0 = vr.sendEmailCampaignTest({
                                     'session_id' => sid,
                                     'campaign_id' => cid,
                                     'recipients' => test_list,
                                   })
  
  print "Deploying message...You should receive it shortly...\n"
  # attaching the list to the message
  temp = vr.setCampaignLists({
                               'session_id' => sid,
                               'campaign_id' => cid,
                               'list_ids' => [lid],
                             })
  
  print "end of sample code\n"
rescue Exception => e
  print "There was an error: " + e
end






