class TourEntry < ActiveRecord::Base
  validates :page, :page_area, :title, :content, presence: true

  scope :area, -> (page) { where(page: page) if page.present? }
  scope :displayed, -> { where(display: true) }
  scope :positioned, -> { order(:position) }

  PAGE_AREA =  [
                ['Home',
                  [
                    ['Client Area', 'client-area'],
                    ['Navigation', 'primary-navigation'],
                    ['Search tab', 'search-tab'],
                    ['Expertise', 'expertise-tab'],
                    ['A-Z', 'a-to-z-tab'],
                    ['Search box', 'search-box'],
                  ]
                  ],
                ['Service',
                  [
                    ['Supporting services', 'supporting-services'],
                    ['Callback form', 'callback-form'],
                    ['Downloads', 'downloads'],
                    ['Updates tab', 'updates-tab'],
                    ['FAQs tab', 'faqs-tab'],
                    ['Case Studies tab', 'case-studies-tab'],
                    ['Testimonials', 'testimonials'],
                    ['Related services', 'related-services'],
                  ],
                ]
              ]

  validates :page_area, uniqueness: { inclusion: PAGE_AREA, scope: :page }

  def page_title
    klass = Module.const_get(self.page.split('_').first)
    return klass.find(self.page.split('_').last.to_i).name || klass.find(self.page.split('_').last.to_i).title
  rescue NameError
    return self.page
  end
end
