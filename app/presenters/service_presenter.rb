class ServicePresenter < BasePresenter
  presents :service
  delegate :name, to: :service

  def department
    service.department
  end

  def department_name
    service.department.name
  end

  def linked_name(options = {})
    begin
      h.link_to name, h.service_path(service), options
    rescue
      h.link_to name, '#invalid-link', options
    end
  end

  def linked_department(options = {})
    begin
      h.link_to department_name, h.department_path(service.department), options
    rescue
      h.link_to department_name, '#invalid-link', options
    end
  end

  def linked_audience(options = {})
    begin
      h.link_to service.department.audience.name, audience_path(service.department.audience), options
    rescue
      h.link_to service.department.audience.name, '#invalid-link', options
    end
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
