class SetDisplayDefaultOnAudience < ActiveRecord::Migration
  def change
    change_column :audiences, :display, :boolean, default: true
  end
end
