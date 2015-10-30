module Optimadmin
  class TeamMemberPresenter < Optimadmin::BasePresenter
    presents :team_member
    delegate :id, :forename, :surname, to: :team_member

    def title
      "#{forename} #{surname}"
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.raw team_member.specialisms
    end
  end
end
