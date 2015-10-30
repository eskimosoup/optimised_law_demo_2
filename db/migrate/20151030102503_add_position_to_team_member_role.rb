class AddPositionToTeamMemberRole < ActiveRecord::Migration
  def change
    add_column :team_member_roles, :position, :integer
  end
end
