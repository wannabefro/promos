FactoryGirl.define do
  factory :user do
    sequence(:username) {|n| "#{n}#{Faker::Internet.user_name}"}
    sequence(:email) {|n| "#{n}#{Faker::Internet.safe_email}"}
    password Faker::Internet.password
  end
end
