module Optimadmin
  class OfficeLocationPresenter < Optimadmin::BasePresenter
    presents :office_location
    delegate :id, :name, to: :office_location
  end
end
