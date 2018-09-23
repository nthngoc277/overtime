user = User.create!(email: 'user@test.com', password: '123456', password_confirmation: '123456', first_name: 'Ngoc', last_name: 'Ng', phone_number: '0967714977')
user1 = User.create!(email: 'user1@test.com', password: '123456', password_confirmation: '123456', first_name: 'User1', last_name: 'Ng', phone_number: '0967714977')
AdminUser.create!(email: 'admin@nguyen.com', password: '123456', password_confirmation: '123456', first_name: 'Admin', last_name: 'Ng', phone_number: '0967714977')

30.times do |post|
  Post.create!(date: Date.today, user_id: user.id, overtime_hours: 2.5, rationale: "#{post + 1} It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).  t")
end
puts "30 Posts have been created"

30.times do
  AuditLog.create!(user_id: user.id, status: 0, start_date:  6.days.ago)
end
puts "30 Audit Logs have been created"

AuditLog.create!(user_id: user1.id, status: 0, start_date: 6.days.ago)
AuditLog.create!(user_id: user1.id, status: 0, start_date: 13.days.ago)
AuditLog.create!(user_id: user1.id, status: 0, start_date: 20.days.ago)