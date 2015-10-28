class DepartmentPresenter < BasePresenter
  presents :department
  delegate :name, to: :department

  def pluralized_name
    name.possessive
  end

  def services
    department.services
  end

  def summary
    h.simple_format department.summary 
  end
end
