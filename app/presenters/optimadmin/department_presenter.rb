module Optimadmin
  class DepartmentPresenter < Optimadmin::BasePresenter
    presents :department
    delegate :id, to: :department

    def title
      department.name
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format department.summary
    end
  end
end
