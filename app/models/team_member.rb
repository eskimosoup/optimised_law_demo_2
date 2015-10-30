class TeamMember < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, TeamMemberUploader

  validates :forename, :surname, :team_member_role_id, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: { case_sensitive: false, message: 'is already taken, leave blank to generate automatically' }

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where("(display_from <= :today OR display_from IS NULL) AND (display_until >= :today OR display_until IS NULL) AND (display = :true)", today: Time.now, true: true).positioned }
  # http://stackoverflow.com/a/11219778
  scope :name_search, ->(keywords) { where("coalesce(forename, '') || ' ' || coalesce(surname, '') ilike '%' || ? || '%'", keywords).displayed.positioned if keywords }

  belongs_to :team_member_role

  has_many :articles, -> { displayed }, dependent: :destroy
  has_many :testimonials, -> { displayed }, dependent: :nullify
  has_many :service_team_members, dependent: :nullify
  has_many :services, -> { displayed }, through: :service_team_members
  has_many :team_member_offices, dependent: :nullify
  has_many :offices, -> { displayed }, through: :team_member_offices
  has_many :office_locations, -> { displayed }, through: :offices

  def slug_candidates
    [
      :suggested_url,
      [:forename, :surname],
      [:suggested_url, :forename, :surname]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || forename_changed? || surname_changed?
  end
end
