FactoryGirl.define do
  factory :team_member do    
    position 1
forename "MyString"
surname "MyString"
team_member_role
primary_telephone "MyString"
secondary_telephone "MyString"
email_address "MyString"
display_from Date.today
display_until Date.tomorrow
display true
specialisms "<p>MyText</p>"
has_vcard_download true
personal_profile "<p>MyText</p>"
google_plus_link "MyString"
twitter_link "MyString"
linkedin_link "MyString"
mobile_number "MyString"
dx_number "MyString"
suggested_url "MyString"
  trait :with_image do
    image { File.open(File.join(Rails.root, 'spec/support/images/landscape_image.jpg')) }
  end
  factory :team_member_with_image, traits: [:with_image]
  end

end
