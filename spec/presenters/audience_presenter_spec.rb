require 'rails_helper'
#  rspec --tag 'audience'
RSpec.describe AudiencePresenter, type: :presenter, audience: true do
  let(:audience) { build(:audience) }
  subject(:audience_presenter) { AudiencePresenter.new(object: audience, view_template: view) }

  describe 'delegations', :delegation do
    it { should delegate_method(:name).to(:audience) }
  end

  describe 'standard audience' do
    it 'returns the linked name' do
      expect(audience_presenter.linked_name).to eq(link_to audience.name, audience)
    end

    it 'returns the services' do
      expect(audience_presenter.services).to eq(audience.services)
    end
  end
end
