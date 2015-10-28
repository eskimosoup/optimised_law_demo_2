class CreateDownloadCategories < ActiveRecord::Migration
  def change
    create_table :download_categories do |t|
      t.string :name, null: false
      t.string :slug
      t.string :suggested_url
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
