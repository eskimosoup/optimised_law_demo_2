class ServicePresenter < BasePresenter
  presents :service
  delegate :name, to: :service

  def department
    service.department
  end

  def department?
    department.present?
  end

  def audience
    department.audience if department?
  end

  def audience?
    audience.present?
  end

  def department_name
    department.name if department?
  end

  def link
    h.service_path(service)
  rescue
    '#invalid-link'
  end

  def department_link
    h.department_path(department)
  rescue
    '#invalid-link'
  end

  def audience_link
    h.audience_path(audience)
  rescue
    '#invalid-link'
  end

  def linked_name(options = {})
    h.link_to name, link, options
  end

  def linked_department(options = {})
    h.link_to department_name, department_link, options if department?
  end

  def linked_audience(options = {})
    h.link_to service.department.audience.name, audience_link, options if audience?
  end

  def summary
    h.simple_format service.summary
  end

  def content
    h.raw service.content
  end

  def specialisms
    h.raw service.specialisms
  end
end
