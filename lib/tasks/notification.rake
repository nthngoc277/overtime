namespace :notification do
  desc 'Send SMS notification to employee asking them to log if they had overtime or not'
  task sms: :environment do
    puts "I'm in rake task!"
  end
end
