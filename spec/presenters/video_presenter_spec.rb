require 'rails_helper'
#  rspec --tag 'video'
RSpec.describe VideoPresenter, type: :presenter, video: true do
  let(:video) { build(:video) }
  subject(:video_presenter) { VideoPresenter.new(object: video, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:video) }
  end

  describe 'standard video' do
    it 'returns the embed code' do
      expect(video_presenter.embed_code).to eq(raw video.embed_code)
    end

    it 'returns the description' do
      expect(video_presenter.description).to eq(raw video.description)
    end
  end
end
