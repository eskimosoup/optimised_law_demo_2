class TestimonialPresenter < BasePresenter
  presents :testimonial
  delegate :id, :testimonial_type, to: :testimonial

  def title
    "#{testimonial.author} #{testimonial.author_company}"
  end

  def recommendation
    h.raw testimonial.recommendation
  end

  def header
    testimonial_type == 'client' ? 'What our clients are saying...' : 'What our experts are saying...'
  end
end
