module Optimadmin
  class DepartmentsController < Optimadmin::ApplicationController
    before_action :set_department, only: [:show, :edit, :update, :destroy]

    edit_images_for Department, [[:image, { show: ['fill', 200, 200], index: ['fill', 200, 200] }]]

    def index
      @departments = Optimadmin::BaseCollectionPresenter.new(collection: Department.where('name ILIKE ?', "%#{params[:search]}%").page(params[:page]).per(params[:per_page] || 15), view_template: view_context, presenter: Optimadmin::DepartmentPresenter)
    end

    def show
    end

    def new
      @department = Department.new
    end

    def edit
    end

    def create
      @department = Department.new(department_params)
      if @department.save
        redirect_to departments_url, notice: 'Department was successfully created.'
      else
        render :new
      end
    end

    def update
      if @department.update(department_params)
        redirect_to departments_url, notice: 'Department was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @department.destroy
      redirect_to departments_url, notice: 'Department was successfully destroyed.'
    end

  private


    def set_department
      @department = Department.find(params[:id])
    end

    def department_params
      params.require(:department).permit(:name, :summary, :image, :remove_image, :remote_image_url, :image_cache, :slug, :suggested_url, :display, :audience_id)
    end
  end
end
