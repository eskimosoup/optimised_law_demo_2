require 'rails_helper'

RSpec.describe ServiceTestimonial, type: :model do
  it { should belong_to(:testimonial) }
  it { should belong_to(:service) }
end
