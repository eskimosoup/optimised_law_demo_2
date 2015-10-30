class AddSpecialismsToService < ActiveRecord::Migration
  def change
    add_column :services, :specialisms, :text
  end
end
