require 'rails_helper'
#  rspec --tag 'video'
RSpec.describe Video, type: :model, video: true do
  describe 'validations', :validation do
    subject(:video) { build(:video) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:embed_code) }
    it { should validate_presence_of(:video_category_id) }
    it { should validate_uniqueness_of(:suggested_url).allow_blank.case_insensitive.with_message('is already taken, leave blank to generate automatically') }
  end

  describe 'associations', :association do
    it { should belong_to(:video_category) }
    it { should have_many(:service_videos).dependent(:destroy) }
    it { should have_many(:services).through(:service_videos) }
  end

  describe 'scopes', :scope do
    let(:video) { create(:video) }
    let(:hidden_video) { create(:video, display: false) }

    it 'only returns displayed' do
      expect(Video.displayed).not_to include hidden_video
    end
  end

  describe 'friendly id', :friendly_id do
    let(:video) { create(:video) }

    it 'creates a slug if title changed' do
      video.title = 'My new title'
      expect(video.should_generate_new_friendly_id?).to be true
    end

    it 'creates a slug if suggested_url changed' do
      video.suggested_url = 'my-new-titled-video'
      expect(video.should_generate_new_friendly_id?).to be true
    end

    it 'does not create slug when other attributes changed' do
      video = create(:video)
      video.description = 'Gobbledegook'
      expect(video.should_generate_new_friendly_id?).to be false
    end
  end
end
