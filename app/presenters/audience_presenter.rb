class AudiencePresenter < BasePresenter
  presents :audience
  delegate :id, :name, to: :audience

  def linked_name(options = {})
    begin
      h.link_to name, audience_path(audience), options
    rescue
      h.link_to name, '#invalid-link', options
    end
  end

  def services
    audience.services
  end
end
