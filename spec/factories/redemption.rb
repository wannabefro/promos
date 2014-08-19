FactoryGirl.define do
  factory :redemption do
    sequence(:ip_address) {|n| "#{n}#{Faker::Internet.ip_v4_address[1..-1]}"}
    association :code

    trait :real_ip do
      ip_address '76.19.98.41'
    end
  end
end
