class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.belongs_to :article_category, index: true, foreign_key: true
      t.string :title, null: false
      t.text :summary
      t.string :image
      t.text :content
      t.date :date
      t.string :slug
      t.string :suggested_url
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
