class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.integer :position
      t.string :author, null: false
      t.string :author_company
      t.text :recommendation, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
