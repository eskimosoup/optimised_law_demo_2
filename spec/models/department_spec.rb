require 'rails_helper'
#  rspec --tag 'department'
RSpec.describe Department, type: :model, department: true do
  describe 'validations', :validation do
    subject(:department) { build(:department) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:audience_id) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should belong_to(:audience) }
    it { should have_many(:services).dependent(:nullify) }
  end

  describe 'scopes', :scope do
    let(:department) { create(:department) }
    let(:hidden_department) { create(:department, display: false) }

    it 'only returns displayed' do
      expect(Department.displayed).not_to include hidden_department
    end
  end

  describe 'friendly id', :friendly_id do
    let(:department) { create(:department) }

    it 'creates a slug if title changed' do
      department.name = 'My new title'
      expect(department.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      department.suggested_url = 'my-new-titled-department'
      expect(department.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      department = create(:department)
      department.summary = 'Gobbledegook'
      expect(department.should_generate_new_friendly_id?).to be false
    end
  end
end
