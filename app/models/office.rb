class Office < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, OfficeUploader

  belongs_to :office_location
  has_many :team_member_offices, dependent: :nullify
  has_many :team_members, -> { displayed }, through: :team_member_offices

  validates :name, :office_location_id, :building_number, :street, :town, :postcode, :phone_number, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: { case_sensitive: false, message: 'is already taken, leave blank to generate automatically' }

  scope :displayed, -> { where(display: true) }

  def slug_candidates
    [
      :suggested_url,
      :name,
      [:suggested_url, :name]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || name_changed?
  end
end
