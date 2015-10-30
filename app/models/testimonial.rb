class Testimonial < ActiveRecord::Base
  validates :author, :recommendation, presence: true

  belongs_to :team_member
  has_many :service_testimonials, dependent: :destroy
  has_many :services, through: :service_testimonials

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true).positioned }
end
