user = User.create!(email: 'user@test.com', password: '123456', password_confirmation: '123456', first_name: 'Ngoc', last_name: 'Ng', phone_number: '0967714977')
User.create!(email: 'user1@test.com', password: '123456', password_confirmation: '123456', first_name: 'User1', last_name: 'Ng', phone_number: '0967714977')
AdminUser.create!(email: 'admin@nguyen.com', password: '123456', password_confirmation: '123456', first_name: 'Admin', last_name: 'Ng', phone_number: '0967714977')

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post + 1} rationale content", user_id: user.id, overtime_hours: 2.5)
end
puts "100 Posts have been created"