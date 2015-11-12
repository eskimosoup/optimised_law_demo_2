class AudiencePresenter < BasePresenter
  presents :audience
  delegate :id, :name, to: :audience

  def link
    h.audience_path(audience)
  rescue
    '#invalid-link'
  end

  def linked_name(options = {})
    h.link_to name, link, options
  end

  def services
    audience.services if audience.services.present?
  end

  def services_for_letter(letter)
    services.where("LOWER(services.name) LIKE ?", "#{letter}%").uniq if audience.services.present?
  end
end
