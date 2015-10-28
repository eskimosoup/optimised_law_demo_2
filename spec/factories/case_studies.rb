FactoryGirl.define do
  factory :case_study do
    case_study_category
title "MyString"
summary "MyText"
image "MyString"
content "<p>MyText</p>"
date Date.today
display false
  end

end
