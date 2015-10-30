require 'rails_helper'
#  rspec --tag 'team_member'
RSpec.describe TeamMember, type: :model, team_member: true do
  describe 'validations', :validation do
    subject(:team_member) { build(:team_member) }
    it { should validate_presence_of(:forename) }
    it { should validate_presence_of(:surname) }
    it { should validate_presence_of(:team_member_role_id) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should belong_to(:team_member_role) }
    it { should have_many(:articles).dependent(:destroy) }
    it { should have_many(:testimonials).dependent(:nullify) }
    it { should have_many(:team_member_offices).dependent(:nullify) }
    it { should have_many(:offices).through(:team_member_offices) }
    it { should have_many(:office_locations).through(:offices) }
    it { should have_many(:service_team_members).dependent(:nullify) }
    it { should have_many(:services).through(:service_team_members) }
  end

  describe 'scopes', :scope do
    let(:team_member) { create(:team_member) }
    let(:hidden_team_member) { create(:team_member, display: false) }
    let(:future_team_member) { create(:team_member, display_from: (Time.now + 7.days)) }
    let(:past_team_member) { create(:team_member, display_until: (Time.now - 7.days)) }

    it 'only returns displayed' do
      expect(TeamMember.displayed).not_to include hidden_team_member
    end

    it 'does not return future team members' do
      expect(TeamMember.displayed).not_to include future_team_member
    end

    it 'does not return past team members' do
      expect(TeamMember.displayed).not_to include past_team_member
    end
  end

  describe 'friendly_id', :friendly_id do
    let(:team_member) { create(:team_member) }

    it 'creates a slug if forename changed' do
      team_member.forename = 'My new name'
      expect(team_member.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if surname changed' do
      team_member.surname = 'My new name'
      expect(team_member.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      team_member.suggested_url = 'my-new-titled-team_member'
      expect(team_member.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      team_member = create(:team_member)
      team_member.specialisms = 'Gobbledegook'
      expect(team_member.should_generate_new_friendly_id?).to be false
    end
  end
end
