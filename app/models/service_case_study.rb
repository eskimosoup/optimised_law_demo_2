class ServiceCaseStudy < ActiveRecord::Base
  belongs_to :case_study
  belongs_to :service
end
