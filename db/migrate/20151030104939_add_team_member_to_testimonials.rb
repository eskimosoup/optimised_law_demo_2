class AddTeamMemberToTestimonials < ActiveRecord::Migration
  def change
    add_reference :testimonials, :team_member, index: true, foreign_key: true
    add_reference :articles, :team_member, index: true, foreign_key: true
  end
end
