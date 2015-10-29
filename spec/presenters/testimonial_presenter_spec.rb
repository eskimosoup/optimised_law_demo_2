require 'rails_helper'
#  rspec --tag 'testimonial'
RSpec.describe TestimonialPresenter, type: :presenter, testimonial: true do
  let(:testimonial) { build(:testimonial) }
  subject(:testimonial_presenter) { TestimonialPresenter.new(object: testimonial, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:id).to(:testimonial) }
  end

  describe 'standard testimonial' do
    it 'returns the recommendation - html escaped' do
      expect(testimonial_presenter.recommendation).to eq(raw testimonial.recommendation)
    end
    it 'returns the author' do
      expect(testimonial_presenter.title).to eq("#{testimonial.author} #{testimonial.author_company}")
    end
  end
end
