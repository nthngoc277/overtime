FactoryGirl.define do
  sequence :email do |e|
    "test#{e}@example.com"
  end

  factory :user do
    email { generate :email }
    password "123456"
    password_confirmation "123456"
    first_name "FirstName"
    last_name "LastName"
  end

  factory :admin_user, class: 'AdminUser' do
    email { generate :email }
    password "123456"
    password_confirmation "123456"
    first_name "Admin"
    last_name "LastName"
  end
end
