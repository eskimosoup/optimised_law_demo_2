FactoryGirl.define do
  factory :testimonial do
    position 1
    author "MyString"
    author_company "MyString"
    recommendation "<p>MyText</p>"
    testimonial_type "client"
    display true
  end

end
