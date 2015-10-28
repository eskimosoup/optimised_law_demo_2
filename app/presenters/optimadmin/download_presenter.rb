module Optimadmin
  class DownloadPresenter < Optimadmin::BasePresenter
    presents :download
    delegate :id, to: :download

    def title
      download.title
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format download.summary
    end
  end
end
