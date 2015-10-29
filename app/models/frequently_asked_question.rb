class FrequentlyAskedQuestion < ActiveRecord::Base
  validates :question, :answer, presence: true
  
  scope :positioned, -> { order(:position) }
  scope :displayed, -> { where(display: true) }
end
