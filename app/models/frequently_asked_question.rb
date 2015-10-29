class FrequentlyAskedQuestion < ActiveRecord::Base
  validates :question, :answer, presence: true

  has_many :service_faqs, dependent: :destroy
  has_many :services, through: :service_faqs

  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true).positioned }
end
