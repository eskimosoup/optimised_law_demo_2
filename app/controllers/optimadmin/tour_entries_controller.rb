module Optimadmin
  class TourEntriesController < Optimadmin::ApplicationController
    before_action :set_tour_entry, only: [:show, :edit, :update, :destroy]

    def index
      @tour_entries = Optimadmin::BaseCollectionPresenter.new(collection: TourEntry.where('title ILIKE ?', "%#{params[:search]}%").positioned.area(params[:area]).page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::TourEntryPresenter)
    end

    def show
    end

    def new
      @tour_entry = TourEntry.new
    end

    def edit
    end

    def create
      @tour_entry = TourEntry.new(tour_entry_params)
      if @tour_entry.save
        redirect_to tour_entries_url, notice: 'Tour entry was successfully created.'
      else
        render :new
      end
    end

    def update
      if @tour_entry.update(tour_entry_params)
        redirect_to tour_entries_url, notice: 'Tour entry was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @tour_entry.destroy
      redirect_to tour_entries_url, notice: 'Tour entry was successfully destroyed.'
    end

  private


    def set_tour_entry
      @tour_entry = TourEntry.find(params[:id])
    end

    def tour_entry_params
      params.require(:tour_entry).permit(:position, :page, :page_area, :title, :content, :joyride_options, :display, :next_page)
    end
  end
end
