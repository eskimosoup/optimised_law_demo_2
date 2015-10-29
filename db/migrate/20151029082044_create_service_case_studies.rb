class CreateServiceCaseStudies < ActiveRecord::Migration
  def change
    create_table :service_case_studies do |t|
      t.belongs_to :case_study, index: true, foreign_key: true
      t.belongs_to :service, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
