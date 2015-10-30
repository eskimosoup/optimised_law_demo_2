require "rails_helper"
#  rspec --tag "team_member"
RSpec.describe TeamMemberPresenter, type: :presenter, team_member: true do
  let(:team_member) { build(:team_member) }
  subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:id).to(:team_member) }
    it { should delegate_method(:forename).to(:team_member) }
    it { should delegate_method(:surname).to(:team_member) }
    it { should delegate_method(:primary_telephone).to(:team_member) }
    it { should delegate_method(:secondary_telephone).to(:team_member) }
  end

  describe "standard team_member" do
    it "returns the name" do
      expect(team_member_presenter.full_name).to eq([team_member.forename, team_member.surname].join(' '))
    end

    it 'returns the link' do
      expect(team_member_presenter.link).to eq(team_member)
    end

    it 'returns a random testimonial' do
      # FIXME
      # expect(team_member_presenter.random_testimonial).to eq(team_member.testimonials.order('rand()'))
    end

    it 'returns the offices_list' do
      expect(team_member_presenter.offices_list).to eq(team_member.team_member_offices.map{|x| x.office.name }.join(', '))
    end

    it 'returns the role' do
      expect(team_member_presenter.role).to eq(team_member.team_member_role.name)
    end

    it "returns the vcard link" do
      expect(team_member_presenter.vcard).to eq(link_to 'Download vCard', '#')
    end

    it "returns the Google Plus link" do
      expect(team_member_presenter.linked_google_plus('Google+', { title: 'Google+', target: '_blank' })).to eq(link_to 'Google+', team_member.google_plus_link, title: 'Google+', target: '_blank')
    end

    it "returns the Twitter link" do
      expect(team_member_presenter.linked_twitter('Follow me on Twitter', { title: 'Follow me on Twitter', target: '_blank' })).to eq(link_to 'Follow me on Twitter', team_member.twitter_link, title: 'Follow me on Twitter',  target: '_blank')
    end

    it "returns the LinkedIn link" do
      expect(team_member_presenter.linked_linkedin('Connect with me on LinkedIn', { title: 'Connect with me on LinkedIn', target: '_blank' })).to eq(link_to 'Connect with me on LinkedIn', team_member.linkedin_link, title: 'Connect with me on LinkedIn',  target: '_blank')
    end

    it "returns the html formatted personal_profile" do
      expect(team_member_presenter.personal_profile).to eq(raw team_member.personal_profile)
    end

    it "returns the html formatted specialisms" do
      expect(team_member_presenter.specialisms).to eq(raw team_member.specialisms)
    end

    it "returns the mail_to email" do
      expect(team_member_presenter.linked_email_address).to eq(mail_to team_member.email_address)
    end

    it "returns the dx number" do
      expect(team_member_presenter.dx_number).to eq(team_member.dx_number)
    end

    it "returns the mobile" do
      expect(team_member_presenter.mobile_number).to eq(team_member.mobile_number)
    end
  end

  describe "images" do
    describe "no image" do
      it "show_image should return nil" do
        expect(team_member_presenter.show_image).to eq(nil)
      end
      it "index_image should return nil" do
        expect(team_member_presenter.index_image).to eq(nil)
      end
    end

    describe "has image" do
      let(:team_member) { build(:team_member_with_image) }
      subject(:team_member_presenter) { TeamMemberPresenter.new(object: team_member, view_template: view)}

      it "show_image should not return nil" do
        expect(team_member_presenter.show_image(alt: team_member_presenter.full_name)).to eq(image_tag(team_member.image.show, alt: [team_member.forename, team_member.surname].join(' ')))
      end

      it "index image should not return nil" do
        expect(team_member_presenter.index_image(alt: team_member_presenter.full_name)).to eq(image_tag(team_member.image.index, alt: [team_member.forename, team_member.surname].join(' ')))
      end
    end
  end
end
