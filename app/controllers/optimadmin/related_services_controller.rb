module Optimadmin
  class RelatedServicesController < Optimadmin::ApplicationController
    before_action :set_service

    def index
      related_services = @service.service_related_services.includes(:related_service).order(position: :asc)
      @related_services = Optimadmin::BaseCollectionPresenter.new(collection: related_services,
                                                                  view_template: view_context,
                                                                  presenter: Optimadmin::RelatedServicePresenter)
    end

    def destroy
      @service_related_service = ServiceRelatedService.find(params[:id])
      @service_related_service.destroy
      redirect_to service_related_services_path(@service), notice: "Related Service Link Destroyed"
    end

    private

    def set_service
      @service = Service.friendly.find(params[:service_id])
    end
  end
end
