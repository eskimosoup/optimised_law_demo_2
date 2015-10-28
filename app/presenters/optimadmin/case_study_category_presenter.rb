module Optimadmin
  class CaseStudyCategoryPresenter < Optimadmin::BasePresenter
    presents :case_study_category
    delegate :id, :name, to: :case_study_category
  end
end
