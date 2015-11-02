class AdditionalContent < ActiveRecord::Base
  AREAS = [
              'Tour Prompt'
            ]


  validates :content, presence: true
  validates :area, uniqueness: { in: AREAS }, presence: true

  scope :displayed, -> { where(display: true) }
end
