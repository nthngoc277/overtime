user = User.create!(email: 'ngoc@nguyen.com', password: '123456', password_confirmation: '123456', first_name: 'Ngoc', last_name: 'Nguyen')
100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post + 1} rationale content", user_id: user.id)
end
puts "100 Posts have been created"