require 'rails_helper'
#  rspec --tag 'case_study_category'
RSpec.describe CaseStudyCategory, type: :model, case_study_category: true do
  describe 'validations', :validation do
    subject(:case_study_category) { build(:case_study_category) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should have_many(:case_studies).dependent(:destroy) }
  end

  describe 'scopes', :scope do
    let(:case_study_category) { create(:case_study_category) }
    let(:hidden_case_study_category) { create(:case_study_category, display: false) }

    it 'only returns displayed' do
      expect(CaseStudyCategory.displayed).not_to include hidden_case_study_category
    end
  end

  describe 'friendly id', :friendly_id do
    let(:case_study_category) { create(:case_study_category) }

    it 'creates a slug if title changed' do
      case_study_category.name = 'My new title'
      expect(case_study_category.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      case_study_category.suggested_url = 'my-new-titled-case_study_category'
      expect(case_study_category.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      case_study_category = create(:case_study_category)
      case_study_category.display = false
      expect(case_study_category.should_generate_new_friendly_id?).to be false
    end
  end
end
