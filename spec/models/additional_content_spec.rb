require 'rails_helper'
#  rspec --tag 'additional_content'
RSpec.describe AdditionalContent, type: :model, additional_content: true do
  describe 'validations', :validation do
    subject(:additional_content) { build(:additional_content) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:area) }
    it { should validate_uniqueness_of(:area) }
    it { should validate_inclusion_of(:area).in_array(AdditionalContent::AREAS) }
  end
end
