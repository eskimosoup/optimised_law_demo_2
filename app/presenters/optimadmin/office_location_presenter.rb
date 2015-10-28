module Optimadmin
  class OfficeLocationPresenter < Optimadmin::BasePresenter
    presents :office_location
    delegate :id, :name, to: :office_location

    def toggle_title
      inline_detail_toggle_link(name)
    end
  end
end
