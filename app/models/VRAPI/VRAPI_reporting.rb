#!/usr/local/bin/ruby   

require 'rubygems'
require 'login.rb'
require 'VRAPIDriver.rb'
vr = VRAPIPortType.new


puts "Log-in..."
sid = vr.login({
                 'username' => $username,
                 'password' => $pass,
                 'session_duration_minutes' => $ses_time,
               })


puts "Getting the list of five sent email Campaigns"
campaigns = vr.enumerateEmailCampaigns({
                                         'session_id' => sid,
                                         'statuses' => ['sent'],
                                         'limit' => 5
                                       })


puts "List of all campaigns sent"
for i in campaigns
  puts 'id           : ' + i.id.to_s 
  puts 'name         : ' + i.name.to_s
  puts 'type         : ' + i.type.to_s
  puts 'sent size    : ' + i.sent_size.to_s
  puts 'creation date: ' + i.creation_date.to_s
  puts "\n"
end

puts "Sample script end"
