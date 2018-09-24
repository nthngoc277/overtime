class ManagerMailer < ApplicationMailer
  def overtime_report_email(manager)
    @manager = manager
    @request_url = root_url
    mail(to: @manager.email, subject: 'Daily Overtime Request Email')
  end
end
