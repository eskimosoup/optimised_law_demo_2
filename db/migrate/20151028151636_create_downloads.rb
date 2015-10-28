class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.belongs_to :download_category, index: true, foreign_key: true
      t.string :title, null: false
      t.text :summary
      t.text :content
      t.string :image
      t.string :file, null: false
      t.boolean :display, default: true
      t.string :slug
      t.string :suggested_url

      t.timestamps null: false
    end
  end
end
