class ServicePresenter < BasePresenter
  presents :service
  delegate :name, to: :service

  def department_name
    service.department.name
  end

  def summary
    h.simple_format service.summary
  end

  def content
    h.raw service.content
  end
end
