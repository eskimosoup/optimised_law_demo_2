require 'rails_helper'
#  rspec --tag 'case_study'
RSpec.describe CaseStudy, type: :model, case_study: true do
  describe 'validations', :validation do
    subject(:case_study) { build(:case_study) }
    it { should validate_presence_of(:case_study_category_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:content) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should belong_to(:case_study_category) }
  end

  describe 'scopes', :scope do
    let(:case_study) { create(:case_study) }
    let(:hidden_case_study) { create(:case_study, display: false) }

    it 'only returns displayed' do
      expect(CaseStudy.displayed).not_to include hidden_case_study
    end
  end

  describe 'friendly id', :friendly_id do
    let(:case_study) { create(:case_study) }

    it 'creates a slug if title changed' do
      case_study.title = 'My new title'
      expect(case_study.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      case_study.suggested_url = 'my-new-titled-case_study'
      expect(case_study.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      case_study = create(:case_study)
      case_study.content = 'Gobbledegook'
      expect(case_study.should_generate_new_friendly_id?).to be false
    end
  end
end
