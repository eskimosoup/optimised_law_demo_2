class Testimonial < ActiveRecord::Base
  validates :testimonial_type, :author, :recommendation, presence: true

  belongs_to :team_member
  has_many :service_testimonials, dependent: :destroy
  has_many :services, through: :service_testimonials

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true).positioned }

  TYPES = %w( client expert )

  validates :testimonial_type, inclusion: TYPES
end
