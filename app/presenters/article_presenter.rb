class ArticlePresenter < BasePresenter
  presents :article
  delegate :title, to: :article

  def linked_title(options = {})
    begin
      h.link_to title, article, options
    rescue
      h.link_to title, '#invalid-link', options
    end
  end

  def link
    begin
      article_path(article)
    rescue
      '#invalid-link'
    end
  end

  def summary
    h.simple_format article.summary
  end

  def content
    h.raw article.content
  end

  def date_block(classes = '')
    h.content_tag :div, class: "article-date #{classes}" do
      h.concat(h.content_tag :div, article.date.strftime('%d'), class: 'article-date-number')
      h.concat(h.content_tag :div, article.date.strftime('%b'), class: 'article-date-month')
    end
  end
end
