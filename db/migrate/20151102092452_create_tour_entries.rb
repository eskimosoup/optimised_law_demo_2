class CreateTourEntries < ActiveRecord::Migration
  def change
    create_table :tour_entries do |t|
      t.integer :position
      t.string :page
      t.string :page_area
      t.string :title
      t.text :content
      t.string :joyride_options
      t.boolean :display, default: true
      t.string :next_page

      t.timestamps null: false
    end
  end
end
