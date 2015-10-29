class CreateFrequentlyAskedQuestions < ActiveRecord::Migration
  def change
    create_table :frequently_asked_questions do |t|
      t.integer :position
      t.string :question, null: false
      t.text :answer, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
