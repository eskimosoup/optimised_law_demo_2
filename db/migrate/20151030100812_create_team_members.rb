class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.integer :position
      t.string :forename, null: false
      t.string :surname, null: false
      t.belongs_to :team_member_role, index: true, foreign_key: true
      t.string :image
      t.string :primary_telephone
      t.string :secondary_telephone
      t.string :email_address
      t.datetime :display_from
      t.datetime :display_until
      t.boolean :display, default: true
      t.text :specialisms
      t.boolean :has_vcard_download
      t.text :personal_profile
      t.string :google_plus_link
      t.string :twitter_link
      t.string :linkedin_link
      t.string :mobile_number
      t.string :dx_number
      t.string :suggested_url, unique: true
      t.string :slug, unique: true

      t.timestamps null: false
    end
  end
end
