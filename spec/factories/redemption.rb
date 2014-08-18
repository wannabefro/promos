FactoryGirl.define do
  factory :redemption do
    sequence(:ip_address) {|n| "#{n}#{Faker::Internet.ip_v4_address[1..-1]}"}
    association :code
  end
end
