FactoryGirl.define do
  factory :card do
    header_color '#2C3E50'
    content_color '#E74C3C'
    association :promotion
    header_text "Best promotion ever"
    content_text "Your code is 1234567890"
  end
end
