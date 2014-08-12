FactoryGirl.define do
  factory :attachment do
    attachment Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/images/kangaroo.jpg')))
  end
end
