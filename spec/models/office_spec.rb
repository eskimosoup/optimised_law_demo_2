require 'rails_helper'
#  rspec --tag 'office'
RSpec.describe Office, type: :model, office: true do
  describe 'validations', :validation do
    subject(:office) { build(:office) }
    # use this for validating images
    # https://github.com/thoughtbot/shoulda/issues/244
    # let(:office) { create(:office) }
    it { should validate_presence_of(:office_location_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:building_number) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:town) }
    it { should validate_presence_of(:postcode) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should belong_to(:office_location) }
    it { should have_many(:team_member_offices).dependent(:nullify) }
    it { should have_many(:team_members).through(:team_member_offices) }
  end

  describe 'scopes', :scope do
    let(:office) { create(:office) }
    let(:hidden_office) { create(:office, display: false) }

    it 'only returns displayed' do
      expect(Office.displayed).not_to include hidden_office
    end
  end

  describe 'friendly id', :friendly_id do
    let(:office) { create(:office) }

    it 'creates a slug if title changed' do
      office.name = 'My new title'
      expect(office.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      office.suggested_url = 'my-new-titled-office'
      expect(office.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      office = create(:office)
      office.building_name = 'Gobbledegook'
      expect(office.should_generate_new_friendly_id?).to be false
    end
  end
end
