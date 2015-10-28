require 'rails_helper'
#  rspec --tag 'download'
RSpec.describe Download, type: :model, download: true do
  describe 'validations', :validation do
    subject(:download) { build(:download) }
    it { should validate_presence_of(:download_category_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:file) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should belong_to(:download_category) }
  end

  describe 'scopes', :scope do
    let(:download) { create(:download) }
    let(:hidden_download) { create(:download, display: false) }

    it 'only returns displayed' do
      expect(Download.displayed).not_to include hidden_download
    end
  end

  describe 'friendly id', :friendly_id do
    let(:download) { create(:download) }

    it 'creates a slug if title changed' do
      download.title = 'My new title'
      expect(download.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      download.suggested_url = 'my-new-titled-download'
      expect(download.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      download = create(:download)
      download.content = 'Gobbledegook'
      expect(download.should_generate_new_friendly_id?).to be false
    end
  end
end
