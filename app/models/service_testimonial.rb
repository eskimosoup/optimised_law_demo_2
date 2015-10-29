class ServiceTestimonial < ActiveRecord::Base
  belongs_to :testimonial
  belongs_to :service
end
