require 'rails_helper'
#  rspec --tag 'case_study'
RSpec.describe CaseStudyPresenter, type: :presenter, case_study: true do
  let(:case_study) { build(:case_study) }
  subject(:case_study_presenter) { CaseStudyPresenter.new(object: case_study, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:title).to(:case_study) }
  end

  describe 'standard case_study' do
    it 'returns the linked title' do
      expect(case_study_presenter.linked_title).to eq(link_to case_study.title, case_study)
    end

    it 'returns the link' do
      expect(case_study_presenter.link).to eq(case_study)
    end

    it 'returns the summary - html formatted' do
      expect(case_study_presenter.summary).to eq(simple_format case_study.summary)
    end

    it 'returns the content - html escaped' do
      expect(case_study_presenter.content).to eq(raw case_study.content)
    end
  end

  describe 'images' do
    describe 'no image' do
      it 'show_image should return nil' do
        expect(case_study_presenter.show_image).to eq(nil)
      end

      it 'index_image should return nil' do
        expect(case_study_presenter.index_image).to eq(nil)
      end
    end

    describe 'has image' do
      let(:case_study) { build(:case_study_with_image) }
      subject(:case_study_presenter) { CaseStudyPresenter.new(object: case_study, view_template: view) }

      it 'show_image should not return nil' do
        expect(case_study_presenter.show_image(alt: case_study.title)).to eq(image_tag(case_study.image.show, alt: case_study.title))
      end

      it 'index image should not return nil' do
        expect(case_study_presenter.index_image(alt: case_study.title)).to eq(image_tag(case_study.image.index, alt: case_study.title))
      end
    end
  end
end
