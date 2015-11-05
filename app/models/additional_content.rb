class AdditionalContent < ActiveRecord::Base
  AREAS = ['Tour Prompt', 'Modal Popup']

  validates :content, presence: true
  validates :area, inclusion: AREAS, presence: true, uniqueness: true

  scope :displayed, -> { where(display: true) }
end
