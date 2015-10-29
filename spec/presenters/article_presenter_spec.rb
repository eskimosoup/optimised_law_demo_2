require 'rails_helper'
#  rspec --tag 'article'
RSpec.describe ArticlePresenter, type: :presenter, article: true do
  let(:article) { build(:article) }
  subject(:article_presenter) { ArticlePresenter.new(object: article, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:article) }
  end

  describe 'standard article' do
    it 'returns the linked title' do
      expect(article_presenter.linked_title).to eq(link_to article.title, article)
    end

    it 'returns the link' do
      expect(article_presenter.link).to eq(article)
    end

    it 'returns the summary - html formatted' do
      expect(article_presenter.summary).to eq(simple_format article.summary)
    end

    it 'returns the content - html escaped' do
      expect(article_presenter.content).to eq(raw article.content)
    end
  end

  describe 'images' do
    describe 'no image' do
      it 'show_image should return nil' do
        expect(article_presenter.show_image).to eq(nil)
      end

      it 'index_image should return nil' do
        expect(article_presenter.index_image).to eq(nil)
      end
    end

    describe 'has image' do
      let(:article) { build(:article_with_image) }
      subject(:article_presenter) { ArticlePresenter.new(object: article, view_template: view) }

      it 'show_image should not return nil' do
        expect(article_presenter.show_image(alt: article.title)).to eq(image_tag(article.image.show, alt: article.title))
      end

      it 'index image should not return nil' do
        expect(article_presenter.index_image(alt: article.title)).to eq(image_tag(article.image.index, alt: article.title))
      end
    end
  end
end
