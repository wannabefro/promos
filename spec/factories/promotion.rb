FactoryGirl.define do
  factory :promotion do
    name Faker::Commerce.product_name
    status 'pending'
    association :user
  end
end
