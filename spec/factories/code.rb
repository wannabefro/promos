FactoryGirl.define do
  factory :code do
    association :promotion
    token Faker::Internet.password(10)
    status 'active'
    quantity 1
    unique true
  end
end
