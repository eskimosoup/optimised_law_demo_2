class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.belongs_to :department, index: true, foreign_key: true
      t.integer :parent_id, index: true
      t.string :name
      t.string :image
      t.text :summary
      t.text :content
      t.string :slug, unique: true
      t.string :suggested_url, unique: true
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
