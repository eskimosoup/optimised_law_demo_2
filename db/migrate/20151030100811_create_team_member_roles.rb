class CreateTeamMemberRoles < ActiveRecord::Migration
  def change
    create_table :team_member_roles do |t|
      t.string :name, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
