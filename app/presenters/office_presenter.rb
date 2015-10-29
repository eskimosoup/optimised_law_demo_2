class OfficePresenter < BasePresenter
  presents :office
  delegate :building_name, :building_number, :street, :town, :county, :postcode, :name, :phone_number, :fax_number, :dx_number, to: :office

  def address
    [building_number, building_name, street, town, county, postcode].reject{|x| x.blank?}.join(', ')
  end

  def linked_email
    h.mail_to office.email
  end

  def details
    h.raw office.details
  end

  def location_name
    office.office_location.name
  end
end
