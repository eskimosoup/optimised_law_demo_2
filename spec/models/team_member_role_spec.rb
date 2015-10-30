require 'rails_helper'
#  rspec --tag 'team_member_role'
RSpec.describe TeamMemberRole, type: :model, team_member_role: true do
  describe 'validations', :validation do
    subject(:team_member_role) { build(:team_member_role) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end

  describe 'associations', :association do
    it { should have_many(:team_members).dependent(:destroy) }
  end

  describe 'scopes', :scope do
    let(:team_member_role) { create(:team_member_role) }
    let(:hidden_team_member_role) { create(:team_member_role, display: false) }

    it 'only returns displayed' do
      expect(TeamMemberRole.displayed).not_to include hidden_team_member_role
    end
  end
end
