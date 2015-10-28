require 'rails_helper'
#  rspec --tag 'office_location'
RSpec.describe OfficeLocation, type: :model, office_location: true do
  describe 'validations', :validation do
    subject(:office_location) { build(:office_location) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should have_many(:offices).dependent(:destroy) }
  end

  describe 'scopes', :scope do
    let(:office_location) { create(:office_location) }
    let(:hidden_office_location) { create(:office_location, display: false) }

    it 'only returns displayed' do
      expect(OfficeLocation.displayed).not_to include hidden_office_location
    end
  end

  describe 'friendly id', :friendly_id do
    let(:office_location) { create(:office_location) }

    it 'creates a slug if name changed' do
      office_location.name = 'My new name'
      expect(office_location.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      office_location.suggested_url = 'my-new-named-office_location'
      expect(office_location.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      office_location = create(:office_location)
      office_location.display = false
      expect(office_location.should_generate_new_friendly_id?).to be false
    end
  end
end
