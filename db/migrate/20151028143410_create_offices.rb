class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :name, null: false
      t.string :building_name
      t.string :building_number
      t.string :street
      t.string :town
      t.string :county
      t.string :postcode
      t.string :phone_number
      t.string :fax_number
      t.string :email
      t.string :dx_number
      t.string :image
      t.text :details
      t.string :slug
      t.string :suggested_url
      t.float :latitude
      t.float :longitude
      t.boolean :display, default: true
      t.belongs_to :office_location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
