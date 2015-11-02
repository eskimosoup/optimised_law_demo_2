module Optimadmin
  class TourEntryPresenter < Optimadmin::BasePresenter
    presents :tour_entry
    delegate :id, :title, :page, :page_title, :next_page, to: :tour_entry

    def page_area
      tour_entry.page_area.humanize.gsub('-', ' ')
    end

    def toggle_title
      if tour_entry.next_page.present?
        inline_detail_toggle_link("<strong>#{title}</strong>".html_safe)
      else
        inline_detail_toggle_link(title)
      end
    end

    def optimadmin_summary
      h.raw tour_entry.content
    end
  end
end
