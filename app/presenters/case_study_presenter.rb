class CaseStudyPresenter < BasePresenter
  presents :case_study
  delegate :title, to: :case_study

  def linked_title(options = {})
    begin
      h.link_to title, case_study, options
    rescue
      h.link_to title, '#invalid-link', options
    end
  end

  def link
    begin
      case_study
    rescue
      '#invalid-link'
    end
  end

  def summary
    h.simple_format case_study.summary
  end

  def content
    h.raw case_study.content
  end

  def date_block(classes = '')
    h.content_tag :div, class: "article-date #{classes}" do
      h.concat(h.content_tag :div, case_study.date.strftime('%d'), class: 'article-date-number')
      h.concat(h.content_tag :div, case_study.date.strftime('%b'), class: 'article-date-month')
    end
  end
end
