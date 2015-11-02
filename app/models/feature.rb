class Feature < ActiveRecord::Base
  extend Flip::Declarable

  strategy Flip::CookieStrategy
  strategy Flip::DatabaseStrategy
  strategy Flip::DeclarationStrategy
  default false

  # Note to who ever adds features:
  # Please use this format: <model_name>_<field_name>
  # For features: <model_name>_feature_<feature_name>

  feature :team_member_vcard_download,
    default: true
  feature :team_member_personal_profile,
    default: true,
    description: 'Team member additional profile (not specialisms)'
  feature :team_member_google_plus_link,
    default: true
  feature :team_member_twitter_link,
    default: true
  feature :team_member_linkedin_link,
    default: true
  feature :team_member_mobile_number,
    default: true,
    description: 'Allow team members to have a mobile number'
  feature :team_member_dx_number,
    default: true,
    description: 'Allow team members to have a DX number'
end
