require 'rails_helper'
#  rspec --tag 'testimonial'
RSpec.describe Testimonial, type: :model, testimonial: true do
  describe 'validations', :validation do
    subject(:testimonial) { build(:testimonial) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:recommendation) }
  end

  describe 'associations', :association do
    it { should belong_to(:team_member) }
    it { should have_many(:service_testimonials).dependent(:destroy) }
    it { should have_many(:services).through(:service_testimonials) }
  end

  describe 'scopes', :scope do
    let(:testimonial) { create(:testimonial) }
    let(:hidden_testimonial) { create(:testimonial, display: false) }

    it 'only returns displayed' do
      expect(Testimonial.displayed).not_to include hidden_testimonial
    end
  end
end
