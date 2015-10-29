class ServicesController < ApplicationController
  before_action :find_service, only: :show

  def show
    return redirect_to @service, status: :moved_permanently if request.path != service_path(@service)
    @presented_service = presenter(@service, ServicePresenter)
    @presented_service_downloads = collection_presenter(@service.downloads.limit(4), DownloadPresenter)
    @presented_service_articles = collection_presenter(@service.articles.limit(5), ArticlePresenter)
    @presented_service_case_studies = collection_presenter(@service.case_studies.limit(5), CaseStudyPresenter)
    @presented_service_testimonials = collection_presenter(@service.testimonials.limit(10), TestimonialPresenter)
    @presented_service_video = presenter(@service.videos.first, VideoPresenter)
    @service_faqs = @service.frequently_asked_questions
  end

  private

    def find_service
      @service = Service.displayed.find(params[:id])
    end
end
