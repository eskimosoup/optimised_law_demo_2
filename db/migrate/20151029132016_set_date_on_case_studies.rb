class SetDateOnCaseStudies < ActiveRecord::Migration
  def change
    remove_column :case_studies, :date, :string
    add_column :case_studies, :date, :date
  end
end
