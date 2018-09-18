user = User.create!(email: 'user@test.com', password: '123456', password_confirmation: '123456', first_name: 'Ngoc', last_name: 'Ng')
User.create!(email: 'user1@test.com', password: '123456', password_confirmation: '123456', first_name: 'User1', last_name: 'Ng')
AdminUser.create!(email: 'admin@nguyen.com', password: '123456', password_confirmation: '123456', first_name: 'Admin', last_name: 'Ng')

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post + 1} rationale content", user_id: user.id)
end
puts "100 Posts have been created"