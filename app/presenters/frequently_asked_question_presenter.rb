class FrequentlyAskedQuestionPresenter < BasePresenter
  presents :frequently_asked_question
  delegate :id, :question, to: :frequently_asked_question

  def linked_question
    h.link_to question, '#', class: 'toggle-class frequently-asked-question-link', data: { container: ".frequently-asked-question-answer-#{id}", class: 'hide', return: 'false' }
  end

  def answer
    h.raw frequently_asked_question.answer
  end
end
