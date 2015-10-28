module Optimadmin
  class CaseStudyCategoriesController < Optimadmin::ApplicationController
    before_action :set_case_study_category, only: [:show, :edit, :update, :destroy]

    def index
      @case_study_categories = Optimadmin::BaseCollectionPresenter.new(collection: CaseStudyCategory.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::CaseStudyCategoryPresenter)
    end

    def show
    end

    def new
      @case_study_category = CaseStudyCategory.new
    end

    def edit
    end

    def create
      @case_study_category = CaseStudyCategory.new(case_study_category_params)
      if @case_study_category.save
        redirect_to case_study_categories_url, notice: 'Case study category was successfully created.'
      else
        render :new
      end
    end

    def update
      if @case_study_category.update(case_study_category_params)
        redirect_to case_study_categories_url, notice: 'Case study category was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @case_study_category.destroy
      redirect_to case_study_categories_url, notice: 'Case study category was successfully destroyed.'
    end

  private


    def set_case_study_category
      @case_study_category = CaseStudyCategory.find(params[:id])
    end

    def case_study_category_params
      params.require(:case_study_category).permit(:name, :suggested_url, :display)
    end
  end
end
