# Default application controller
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :global_site_settings, :load_objects

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: -> { render_error(404) }
    rescue_from ActiveRecord::RecordNotFound, with: -> { render_error(404) }
    rescue_from ActionController::RoutingError, with: -> { render_error(404) }
  end

  def render_error(status)
    respond_to do |format|
      format.html { render 'errors/404', status: status }
      format.all { render nothing: true, status: status }
    end
  end

  def index
  end

  def divorce
  end

  private

    def load_objects
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
