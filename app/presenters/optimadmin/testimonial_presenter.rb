module Optimadmin
  class TestimonialPresenter < Optimadmin::BasePresenter
    presents :testimonial
    delegate :id, to: :testimonial

    def title
      "#{testimonial.author} #{testimonial.author_company}"
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format testimonial.recommendation
    end
  end
end
