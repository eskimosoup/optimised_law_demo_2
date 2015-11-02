class TeamMemberPresenter < BasePresenter
  presents :team_member
  delegate :id, :forename, :surname, :primary_telephone, :secondary_telephone, :email_address, to: :team_member

  def link
    begin
      h.team_member_path(team_member)
    rescue
      '#invalid-link'
    end
  end

  def offices_list
    team_member.team_member_offices.map{|x| x.office.name }.join(', ')
  end

  def full_name
    [forename, surname].join(' ')
  end

  def role
    team_member.team_member_role.name
  end

  def linked_email_address
    h.mail_to team_member.email_address
  end

  def specialisms
    h.raw team_member.specialisms
  end

  def linked_google_plus(text = 'Google+', options = {})
    h.link_to text, team_member.google_plus_link, options if Flip.team_member_google_plus_link?
  end

  def linked_twitter(text = 'Follow me on Twitter', options = {})
    h.link_to text, team_member.twitter_link, options if Flip.team_member_twitter_link?
  end

  def linked_linkedin(text = 'Connect with me on LinkedIn', options = {})
    h.link_to text, team_member.linkedin_link, options if Flip.team_member_linkedin_link?
  end

  def personal_profile
    h.raw team_member.personal_profile if Flip.team_member_personal_profile?
  end

  def vcard(options = {})
    h.link_to 'Download vCard', '#', options if Flip.team_member_vcard_download?
  end

  def mobile_number
    team_member.mobile_number if Flip.team_member_mobile_number?
  end

  def dx_number
    team_member.dx_number if Flip.team_member_dx_number?
  end

  def random_testimonial_recommendation
    random_testimonial = team_member.testimonials.order('random()').first
    h.raw random_testimonial.recommendation
  end
end
