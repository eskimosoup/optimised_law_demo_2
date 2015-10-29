module Optimadmin
  class VideoCategoriesController < Optimadmin::ApplicationController
    before_action :set_video_category, only: [:show, :edit, :update, :destroy]

    def index
      @video_categories = Optimadmin::BaseCollectionPresenter.new(collection: VideoCategory.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::VideoCategoryPresenter)
    end

    def show
    end

    def new
      @video_category = VideoCategory.new
    end

    def edit
    end

    def create
      @video_category = VideoCategory.new(video_category_params)
      if @video_category.save
        redirect_to video_categories_url, notice: 'Video category was successfully created.'
      else
        render :new
      end
    end

    def update
      if @video_category.update(video_category_params)
        redirect_to video_categories_url, notice: 'Video category was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @video_category.destroy
      redirect_to video_categories_url, notice: 'Video category was successfully destroyed.'
    end

  private


    def set_video_category
      @video_category = VideoCategory.find(params[:id])
    end

    def video_category_params
      params.require(:video_category).permit(:name, :suggested_url, :display)
    end
  end
end
