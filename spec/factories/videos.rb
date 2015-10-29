FactoryGirl.define do
  factory :video do
    title "MyString"
    video_category
    description "<p>MyText</p>"
    embed_code "MyText"
    display true
    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :video_with_image, traits: [:with_image]
  end

end
