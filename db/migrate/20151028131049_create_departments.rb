class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name, null: false
      t.string :summary
      t.string :image
      t.string :slug, unique: true
      t.string :suggested_url, unique: true
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
