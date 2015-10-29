class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.belongs_to :video_category, index: true, foreign_key: true
      t.text :description
      t.string :image
      t.text :embed_code, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
