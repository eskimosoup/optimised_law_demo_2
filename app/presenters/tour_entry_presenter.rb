class TourEntryPresenter < Optimadmin::BasePresenter
  presents :tour_entry
  delegate :page, :page_area, :title, :joyride_options, to: :tour_entry

  def content
    h.raw tour_entry.content
  end

  def next_page
    return nil unless tour_entry.next_page.present?
    "#{tour_entry.next_page}?tour=1"
  end
end
