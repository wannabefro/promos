FactoryGirl.define do
  factory :promotion do
    name Faker::Commerce.product_name
    status 'active'
    message Faker::Lorem.paragraph
    association :user
    code_quantity 10

    trait :with_unique_codes do
      after(:create) do |p|
        FactoryGirl.create_list(:code, p.code_quantity, promotion: p)
      end 
    end

    trait :with_duplicate_codes do
      after(:create) do |p|
        FactoryGirl.create(:code, quantity: p.code_quantity, unique: false, promotion: p)
      end
    end
  end
end
