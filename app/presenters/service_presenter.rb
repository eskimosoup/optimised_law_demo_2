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

  def linked_name(options = {})
    h.link_to name, h.service_path(service), options
  end

  def linked_department(options = {})
    h.link_to department_name, h.department_path(department), options if department?
  end

  def linked_audience(options = {})
    h.link_to service.department.audience.name, h.audience_path(audience), options if audience?
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
