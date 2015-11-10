class Download < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, DownloadUploader
  mount_uploader :file, Optimadmin::DocumentUploader

  belongs_to :download_category
  has_many :service_downloads, dependent: :destroy
  has_many :services, through: :service_downloads

  validates :title, :file, :download_category_id, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: { case_sensitive: false, message: 'is already taken, leave blank to generate automatically' }

  scope :displayed, -> { joins(:download_category).where(display: true).order(:title).merge(DownloadCategory.displayed) }

  def slug_candidates
    [
      :suggested_url,
      :title,
      [:suggested_url, :title]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || title_changed?
  end
end
