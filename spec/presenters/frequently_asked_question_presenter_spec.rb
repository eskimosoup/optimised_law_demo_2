require 'rails_helper'
#  rspec --tag 'frequently_asked_question'
RSpec.describe FrequentlyAskedQuestionPresenter, type: :presenter, frequently_asked_question: true do
  let(:frequently_asked_question) { build(:frequently_asked_question) }
  subject(:frequently_asked_question_presenter) { FrequentlyAskedQuestionPresenter.new(object: frequently_asked_question, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:id).to(:frequently_asked_question) }
    it { should delegate_method(:question).to(:frequently_asked_question) }
  end

  describe 'standard frequently_asked_question' do
    it 'returns the linked title' do
      expect(frequently_asked_question_presenter.linked_question).to eq(link_to frequently_asked_question.question, '#', class: 'toggle-class frequently-asked-question-link', data: { container: ".frequently-asked-question-answer-#{frequently_asked_question.id}", class: 'hide', return: 'false' })
    end

    it 'returns the content - html escaped' do
      expect(frequently_asked_question_presenter.answer).to eq(raw frequently_asked_question.answer)
    end
  end
end
