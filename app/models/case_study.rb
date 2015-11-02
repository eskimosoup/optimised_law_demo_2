class CaseStudy < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :history]

  mount_uploader :image, ArticleUploader

  belongs_to :case_study_category
  has_many :service_case_studies, dependent: :destroy
  has_many :services, through: :service_case_studies

  validates :title, :summary, :content, :case_study_category_id, presence: true
  validates :suggested_url, allow_blank: true, uniqueness: { case_sensitive: false, message: 'is already taken, leave blank to generate automatically' }

  scope :displayed, -> { joins(:case_study_category).where("case_studies.display = ? AND date <= ?", true, Date.today).order(date: :desc).merge(CaseStudyCategory.displayed) }

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
