module Optimadmin
  class ServicePresenter < Optimadmin::BasePresenter
    presents :service
    delegate :id, to: :service

    def reorder_related_services_link
      return nil if service.related_services.count <= 1
      h.link_to "Reorder #{ h.pluralize service.related_services.count, "Service" }", h.service_related_services_path(service)
    end

    def title
      service.name
    end

    def toggle_title
      h.content_tag :div do
        h.concat inline_detail_toggle_link(title)
        h.concat h.content_tag :div, service.department.name, style: 'font-size: 12px;' if department.present?
      end
    end

    def optimadmin_summary
      h.simple_format service.summary
    end

    private

    def department
      return @department if defined? @department
      @department = service.department
    end
  end
end
