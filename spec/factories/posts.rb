FactoryGirl.define do
  factory :post do
    date Date.today
    rationale "Some Rationale"
    overtime_hours 3.5
    user
  end

  factory :second_post, class: 'Post' do
    date Date.yesterday
    rationale "Some other Rationale"
    overtime_hours 0.5
    user
  end
end
