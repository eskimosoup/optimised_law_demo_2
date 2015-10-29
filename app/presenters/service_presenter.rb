class ServicePresenter < BasePresenter
  presents :service
  delegate :name, to: :service

  def department_name
    service.department.name
  end

  def linked_name(options = {})
    begin
      h.link_to name, service, options
    rescue
      h.link_to name, '#invalid-link', options
    end
  end

  def linked_department(options = {})
    begin
      h.link_to department_name, service.department, options
    rescue
      h.link_to department_name, '#invalid-link', options
    end
  end

  def linked_audience(options = {})
    begin
      h.link_to service.department.audience.name, service.department.audience, options
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
end
