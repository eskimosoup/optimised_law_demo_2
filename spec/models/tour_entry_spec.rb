require 'rails_helper'

RSpec.describe TourEntry, type: :model do
  describe "validations", :validation do
    subject(:tour_entry) { build(:tour_entry) }
    it { should validate_presence_of(:page) }
    it { should validate_inclusion_of(:page_area).in_array(TourEntry::PAGE_AREA) }
    it { should validate_presence_of(:page_area) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
    it { should validate_uniqueness_of(:page_area).scoped_to(:page) }
  end

  describe "scopes", :scope do
    let(:tour_entry) { create(:tour_entry) }
    let(:hidden_tour_entry) { create(:tour_entry, display: false) }

    it 'only returns displayed' do
      expect(TourEntry.displayed).not_to include hidden_tour_entry
    end
  end
end
