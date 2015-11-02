FactoryGirl.define do
  factory :case_study do
    case_study_category
title "MyString"
summary "MyText"
image "MyString"
content "<p>MyText</p>"
date Date.today
display false
  trait :with_image do
    image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
  end
  factory :case_study_with_image, traits: [:with_image]
  end

end
