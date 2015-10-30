class AudiencePresenter < BasePresenter
  presents :audience
  delegate :name, to: :audience

  def linked_name(options = {})
    begin
      h.link_to name, audience_path(audience), options
    rescue
      h.link_to name, '#invalid-link', options
    end
  end
end
