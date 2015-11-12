class ServicesController < ApplicationController
  before_action :find_service, only: :show

  def show
    return redirect_to @service, status: :moved_permanently if request.path != service_path(@service)
    @presented_tour_entries = collection_presenter(TourEntry.where(page: "#{controller_name.classify}_#{@service.id}").positioned.displayed, TourEntryPresenter)
    @presented_service = presenter(@service, ServicePresenter)
    @presented_service_downloads = collection_presenter(@service.downloads.limit(4), DownloadPresenter) if @service.downloads.present?
    @presented_service_articles = collection_presenter(@service.articles.limit(5), ArticlePresenter) if @service.articles.present?
    @presented_service_case_studies = collection_presenter(@service.case_studies.limit(5), CaseStudyPresenter) if @service.case_studies.present?
    @presented_service_testimonials = collection_presenter(@service.testimonials.limit(10), TestimonialPresenter) if @service.testimonials.present?
    @presented_service_video = presenter(@service.videos.first, VideoPresenter) if @service.videos.present?
    @presented_related_services = collection_presenter(@service.related_services, ServicePresenter) if @service.related_services.present?
    @service_team_members = @service.team_members if @service.team_members.present?
    @service_faqs = @service.frequently_asked_questions if @service.frequently_asked_questions.present?
  end

  def a_to_z
    @presented_a_to_z = collection_presenter(Audience.eager_load(:departments, :services).displayed, AudiencePresenter)
    @letter = params[:letter]

    respond_to do |format|
      format.js
    end
  end

  private

    def find_service
      @service = Service.displayed.find(params[:id])
    end
end
