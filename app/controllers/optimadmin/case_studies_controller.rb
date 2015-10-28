module Optimadmin
  class CaseStudiesController < Optimadmin::ApplicationController
    before_action :set_case_study, only: [:show, :edit, :update, :destroy]

    edit_images_for CaseStudy, [[:image, { show: ['fill', 200, 200], index: ['fill', 200, 200] }]]

    def index
      @case_studies = Optimadmin::BaseCollectionPresenter.new(collection: CaseStudy.where('title ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::CaseStudyPresenter)
    end

    def show
    end

    def new
      @case_study = CaseStudy.new
    end

    def edit
    end

    def create
      @case_study = CaseStudy.new(case_study_params)
      if @case_study.save
        redirect_to case_studies_url, notice: 'Case study was successfully created.'
      else
        render :new
      end
    end

    def update
      if @case_study.update(case_study_params)
        redirect_to case_studies_url, notice: 'Case study was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @case_study.destroy
      redirect_to case_studies_url, notice: 'Case study was successfully destroyed.'
    end

  private


    def set_case_study
      @case_study = CaseStudy.find(params[:id])
    end

    def case_study_params
      params.require(:case_study).permit(:case_study_category_id, :title, :summary, :image, :content, :date, :suggested_url, :display)
    end
  end
end
