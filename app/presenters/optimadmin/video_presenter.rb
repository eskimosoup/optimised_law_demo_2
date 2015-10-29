module Optimadmin
  class VideoPresenter < Optimadmin::BasePresenter
    presents :video
    delegate :id, to: :video

    def title
      video.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format video.description
    end
  end
end
