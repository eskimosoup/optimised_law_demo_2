FactoryGirl.define do
  factory :service do
    department
name "MyString"
image "MyString"
summary "MyText"
content "<p>MyText</p>"
specialisms "<p>My text</p>"
display true
    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :service_with_image, traits: [:with_image]
  end

end
