class Testimonial < ActiveRecord::Base
  validates :author, :recommendation, presence: true

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
