module Optimadmin
  class VideoCategoryPresenter < Optimadmin::BasePresenter
    presents :video_category
    delegate :id, :name, to: :video_category
  end
end
