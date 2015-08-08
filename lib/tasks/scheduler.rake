desc "This task is called by the Heroku scheduler add-on"
task :activate_ticket => :environment do
  puts "Activating Ticket..."
  CurrentTicket.claim
  puts "done."
end