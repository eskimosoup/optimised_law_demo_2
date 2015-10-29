module Optimadmin
  class AudiencePresenter < Optimadmin::BasePresenter
    presents :audience
    delegate :id, :name, to: :audience
  end
end
