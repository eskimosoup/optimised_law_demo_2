module Optimadmin
  class RelatedServicePresenter < Optimadmin::BasePresenter
    presents :service_related_service

    def id
      service_related_service.id
    end

    def name
      service_related_service.related_service_name
    end

    def delete_link
      h.link_to trash_can, h.service_related_service_path(service_related_service.service, service_related_service),
                method: :delete, data: { confirm: 'Are you sure?' }, class: 'menu-item-control'
    end

  end
end