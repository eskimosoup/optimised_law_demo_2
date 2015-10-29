class CreateAudiences < ActiveRecord::Migration
  def change
    create_table :audiences do |t|
      t.string :name
      t.string :slug
      t.string :suggested_url
      t.boolean :display

      t.timestamps null: false
    end
  end
end
