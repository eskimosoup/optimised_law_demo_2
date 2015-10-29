class DownloadPresenter < BasePresenter
  presents :download
  delegate :title, to: :download

  def summary
    h.simple_format download.summary
  end

  def content
    h.raw download.content
  end

  def contents_summary
    h.raw download.contents_summary
  end

  def download_button(additional_classes = '')
    classes = 'download-button'
    classes = "#{classes} #{additional_classes}" unless additional_classes.blank?
    h.link_to 'Download', download.file.url, title: title, class: classes
  end

  def linked_image(key = 'focus')
    h.link_to download.file.url, title: title, class: 'download-button-image' do
      h.image_tag download.image.send(key), alt: title
    end
  end
end
