require 'rails_helper'
#  rspec --tag 'office'
RSpec.describe OfficePresenter, type: :presenter, office: true do
  let(:office) { build(:office) }
  subject(:office_presenter) { OfficePresenter.new(object: office, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:name).to(:office) }
    it { should delegate_method(:phone_number).to(:office) }
    it { should delegate_method(:fax_number).to(:office) }
    it { should delegate_method(:dx_number).to(:office) }
  end

  describe 'standard office' do
    it 'returns the department name' do
      expect(office_presenter.location_name).to eq(office.office_location.name)
    end

    it 'returns linked email' do
      expect(office_presenter.linked_email).to eq(mail_to office.email)
    end

    it 'returns the details html' do
      expect(office_presenter.details).to eq(raw office.details)
    end
  end

  describe 'images' do
    describe 'no image' do
      it 'show_image should return nil' do
        expect(office_presenter.show_image).to eq(nil)
      end
    end

    describe 'has image' do
      let(:office) { build(:office_with_image) }
      subject(:office_presenter) { OfficePresenter.new(object: office, view_template: view) }

      it 'show_image should not return nil' do
        expect(office_presenter.show_image(alt: office.name)).to eq(image_tag(office.image.show, alt: office.name))
      end
    end
  end
end
