require 'rails_helper'
#  rspec --tag 'department'
RSpec.describe DepartmentPresenter, type: :presenter, department: true do
  let(:department) { build(:department) }
  subject(:department_presenter) { DepartmentPresenter.new(object: department, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:id).to(:department) }
    it { should delegate_method(:name).to(:department) }
  end

  describe 'standard department' do
    # it 'returns the pluralized name' do
      # expect(department_presenter.pluralized_name).to eq(department.possessive)
    # end

    it 'returns the services' do
      expect(department_presenter.services).to eq(department.services)
    end

    it 'returns the summary - html formatted' do
      expect(department_presenter.summary).to eq(simple_format department.summary)
    end
  end

  describe 'images' do
    describe 'no image' do
      it 'show_image should return nil' do
        expect(department_presenter.show_image).to eq(nil)
      end
      it 'index_image should return nil' do
        expect(department_presenter.index_image).to eq(nil)
      end
    end

    describe 'has image' do
      let(:department) { build(:department_with_image) }
      subject(:department_presenter) { DepartmentPresenter.new(object: department, view_template: view) }

      it 'show_image should not return nil' do
        expect(department_presenter.show_image(alt: department.name)).to eq(image_tag(department.image.show, alt: department.name))
      end

      it 'index image should not return nil' do
        expect(department_presenter.index_image(alt: department.name)).to eq(image_tag(department.image.index, alt: department.name))
      end
    end
  end
end
