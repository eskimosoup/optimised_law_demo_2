require "rails_helper"

RSpec.describe TourEntryPresenter, type: :presenter do
  let(:tour_entry) { build(:tour_entry) }
  subject(:tour_entry_presenter) { TourEntry.new(object: tour_entry, view_template: view)}

  describe "delegations", :delegation do
    it { should delegate_method(:page).to(:tour_entry) }
    it { should delegate_method(:page_area).to(:tour_entry) }
    it { should delegate_method(:title).to(:tour_entry) }
    it { should delegate_method(:joyride_options).to(:tour_entry) }
  end

  describe "standard tour entry" do
    it "returns the content - html formatted" do
      expect(tour_entry_presenter.content).to eq(raw tour_entry.content)
    end
    it "returns the next page with query string" do
      expect(tour_entry_presenter.next_page).to eq("#{tour_entry.next_page}?tour=1")
    end
  end

  describe "standard tour entry" do
    let(:tour_entry) { build(:tour_entry, next_page: nil) }
    subject(:tour_entry_presenter) { TourEntry.new(object: tour_entry, view_template: view)}

    it "returns the next page as nil" do
      expect(tour_entry_presenter.next_page).to eq(nil)
    end
  end
end
