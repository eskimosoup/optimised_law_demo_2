class AddPositionToAudience < ActiveRecord::Migration
  def change
    add_column :audiences, :position, :integer
  end
end
