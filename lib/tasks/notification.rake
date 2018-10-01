namespace :notification do
  desc 'Send SMS notification to employee asking them to log if they had overtime or not'
  task sms: :environment do
    puts "I'm in rake task!"
  end

  desc 'Send email notification to managers (admin user) each day to inform of pending overtime requests'
  task manager_email: :environment do
    submitted_posts = Post.submitted
    if submitted_posts.count > 0
      AdminUser.all.each do |manager|
        ManagerMailer.overtime_report_email(manager).deliver
      end
    end
  end
end
