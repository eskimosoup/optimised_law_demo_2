class CreateCaseStudies < ActiveRecord::Migration
  def change
    create_table :case_studies do |t|
      t.belongs_to :case_study_category, index: true, foreign_key: true
      t.string :title, null: false
      t.text :summary, null: false
      t.string :image
      t.text :content, null: false
      t.string :date
      t.string :slug
      t.string :suggested_url
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
