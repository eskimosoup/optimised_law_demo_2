require 'rails_helper'
#  rspec --tag 'download'
RSpec.describe DownloadPresenter, type: :presenter, download: true do
  let(:download) { create(:download) }
  subject(:download_presenter) { DownloadPresenter.new(object: download, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:download) }
  end

  describe 'standard download' do
    it 'returns the download  button' do
      # FIXME
      expect(download_presenter.download_button).to eq(link_to 'Download', download.file, title: download.title, class: 'download-button')
    end

    it 'returns the linked image' do
      # FIXME
      expect(download_presenter.linked_image).to eq(link_to image_tag(download.image.focus, alt: download.title), download.file, title: download.title, class: 'download-button')
    end

    it 'returns the summary - html formatted' do
      expect(download_presenter.summary).to eq(simple_format download.summary)
    end

    it 'returns the content - html escaped' do
      expect(download_presenter.content).to eq(raw download.content)
    end

    it 'returns the contents summary - html escaped' do
      expect(download_presenter.contents_summary).to eq(raw download.contents_summary)
    end
  end

  describe 'images' do
    describe 'no image' do
      it 'focus image should return nil' do
        expect(download_presenter.focus_image).to eq(nil)
      end

      it 'index_image should return nil' do
        expect(download_presenter.index_image).to eq(nil)
      end
    end

    describe 'has image' do
      let(:download) { build(:download_with_image) }
      subject(:download_presenter) { DownloadPresenter.new(object: download, view_template: view) }

      it 'show_image should not return nil' do
        expect(download_presenter.show_image(alt: download.title)).to eq(image_tag(download.image.show, alt: download.title))
      end

      it 'focus image should not return nil' do
        expect(download_presenter.focus_image(alt: download.title)).to eq(image_tag(download.image.focus, alt: download.title))
      end
    end
  end
end
