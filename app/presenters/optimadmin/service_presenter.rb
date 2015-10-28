module Optimadmin
  class ServicePresenter < Optimadmin::BasePresenter
    presents :service
    delegate :id, to: :service

    def title
      service.name
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format service.summary
    end
  end
end
