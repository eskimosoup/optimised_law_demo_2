module Optimadmin
  class FrequentlyAskedQuestionPresenter < Optimadmin::BasePresenter
    presents :frequently_asked_question
    delegate :id, :question, to: :frequently_asked_question

    def toggle_title
      inline_detail_toggle_link(question)
    end

    def optimadmin_summary
      h.raw frequently_asked_question.answer
    end
  end
end
