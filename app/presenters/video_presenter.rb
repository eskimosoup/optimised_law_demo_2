class VideoPresenter < BasePresenter
  presents :video
  delegate :title, to: :video

  def description
    h.raw video.description
  end

  def embed_code
    h.raw video.embed_code
  end
end
