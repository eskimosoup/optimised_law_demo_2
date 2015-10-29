class Service < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, ServiceUploader

  belongs_to :department
  has_many :service_articles, dependent: :nullify
  has_many :articles, -> { displayed }, through: :service_articles
  has_many :service_case_studies, dependent: :nullify
  has_many :case_studies, -> { displayed }, through: :service_case_studies
  has_many :service_faqs, dependent: :nullify
  has_many :frequently_asked_questions, -> { displayed }, through: :service_faqs
  has_many :service_downloads, dependent: :nullify
  has_many :downloads, -> { displayed }, through: :service_downloads
  has_many :service_testimonials, dependent: :nullify
  has_many :testimonials, -> { displayed }, through: :service_testimonials
  has_many :service_videos, dependent: :nullify
  has_many :videos, -> { displayed }, through: :service_videos

  validates :name, :summary, :content, :department_id, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: { case_sensitive: false, message: 'is already taken, leave blank to generate automatically' }

  scope :displayed, -> { where(display: true) }


  def slug_candidates
    [
      :suggested_url,
      :name,
      [:suggested_url, :name]
    ]
  end

  def should_generate_new_friendly_id?
    slug.blank? || suggested_url_changed? || name_changed?
  end
end
