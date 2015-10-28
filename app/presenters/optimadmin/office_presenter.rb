module Optimadmin
  class OfficePresenter < Optimadmin::BasePresenter
    presents :office
    delegate :id, :name, to: :office

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      [building_number, building_name, street, town, county, postcode].reject{|x| x.blank?}.join(', ')
    end
  end
end
