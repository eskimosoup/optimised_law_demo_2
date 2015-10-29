class TestimonialPresenter < BasePresenter
  presents :testimonial
  delegate :id, to: :testimonial

  def title
    "#{testimonial.author} #{testimonial.author_company}"
  end

  def recommendation
    h.raw testimonial.recommendation
  end
end
