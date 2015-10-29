require 'rails_helper'
#  rspec --tag 'service'
RSpec.describe Service, type: :model, service: true do
  describe 'validations', :validation do
    subject(:service) { build(:service) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:summary) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:department_id) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should belong_to(:department) }
    it { should have_many(:service_articles).dependent(:nullify) }
    it { should have_many(:articles).through(:service_articles) }
    it { should have_many(:service_case_studies).dependent(:nullify) }
    it { should have_many(:case_studies).through(:service_case_studies) }
    it { should have_many(:service_faqs).dependent(:nullify) }
    it { should have_many(:frequently_asked_questions).through(:service_faqs) }
    it { should have_many(:service_downloads).dependent(:nullify) }
    it { should have_many(:downloads).through(:service_downloads) }
    it { should have_many(:service_testimonials).dependent(:nullify) }
    it { should have_many(:testimonials).through(:service_testimonials) }
  end

  describe 'scopes', :scope do
    let(:service) { create(:service) }
    let(:hidden_service) { create(:service, display: false) }

    it 'only returns displayed' do
      expect(Service.displayed).not_to include hidden_service
    end
  end

  describe 'friendly id', :friendly_id do
    let(:service) { create(:service) }

    it 'creates a slug if title changed' do
      service.name = 'My new title'
      expect(service.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      service.suggested_url = 'my-new-titled-service'
      expect(service.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      service = create(:service)
      service.content = 'Gobbledegook'
      expect(service.should_generate_new_friendly_id?).to be false
    end
  end
end
