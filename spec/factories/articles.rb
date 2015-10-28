FactoryGirl.define do
  factory :article do
    article_category
title "MyString"
summary "MyText"
image "MyString"
content "<p>MyText</p>"
date Date.today
display true
  end

end
