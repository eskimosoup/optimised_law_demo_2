# Default application controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :global_site_settings, :load_objects

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: -> { render_error(500) }
    rescue_from ActiveRecord::RecordNotFound, with: -> { render_error(404) }
    rescue_from ActionController::RoutingError, with: -> { render_error(404) }
  end

  def render_error(status)
    respond_to do |format|
      format.html { render "errors/#{status}", status: status }
      format.all { render nothing: true, status: status }
    end
  end

  def index
    @presented_tour_prompt = presenter(AdditionalContent.displayed.find_by(area: 'Tour Prompt'), TourEntryPresenter)
    @presented_tour_entries = collection_presenter(TourEntry.where(page: 'Home').positioned.displayed, TourEntryPresenter)
    @presented_audiences = collection_presenter(Audience.displayed, DepartmentPresenter)
    @presented_a_to_z = collection_presenter(Audience.eager_load(:departments, :services).displayed, AudiencePresenter)
    @letter = 'a'
    @presented_a_to_z_group = Service.displayed.group_by{|service| service.name.downcase.first}
  end

  def divorce
  end

  private

    def load_objects
      @presented_contact_modal = presenter(AdditionalContent.displayed.find_by(area: 'Modal Popup'), TourEntryPresenter)
      @presented_offices = collection_presenter(Office.displayed, OfficePresenter)
      @header_menu = Optimadmin::Menu.new(name: "header")
      @header_aside_menu = Optimadmin::Menu.new(name: "aside_header")
      @footer_menu = Optimadmin::Menu.new(name: "footer")
    end

    # Inspired by https://github.com/bparanj/presenter
    def presenter(object, klass)
      klass ||= klass.constantize
      klass.new(object: object, view_template: view_context)
    end

    def collection_presenter(object, klass)
      klass ||= klass.constantize
      BaseCollectionPresenter.new(collection: object, view_template: view_context, presenter: klass)
    end

    def global_site_settings
      @global_site_settings ||= Optimadmin::SiteSetting.current_environment
    end
    helper_method :global_site_settings
end
