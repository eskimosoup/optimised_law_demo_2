class AddAudienceToService < ActiveRecord::Migration
  def change
    add_reference :departments, :audience, index: true, foreign_key: true
  end
end
