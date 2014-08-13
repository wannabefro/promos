FactoryGirl.define do
  factory :promotion do
    name Faker::Commerce.product_name
    status 'active'
    message Faker::Lorem.paragraph
    association :user
  end
end
