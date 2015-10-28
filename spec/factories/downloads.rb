FactoryGirl.define do
  factory :download do
    download_category
    title "MyString"
    summary "MyText"
    content "<p>MyText</p>"
    display true
    file { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    trait :with_image do
      image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
    end
    factory :download_with_image, traits: [:with_image]
  end

end
