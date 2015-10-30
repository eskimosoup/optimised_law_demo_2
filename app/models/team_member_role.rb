class TeamMemberRole < ActiveRecord::Base
  has_many :team_members, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true).positioned }
end
