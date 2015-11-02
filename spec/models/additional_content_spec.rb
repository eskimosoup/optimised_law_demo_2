require 'rails_helper'
#  rspec --tag 'model_name'
RSpec.describe AdditionalContent, type: :model, model_name: true do
  describe 'validations', :validation do
    subject(:model_name) { build(:model_name) }
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:area) }
    it { should validate_uniqueness_of(:area) }
    it { should validate_inclusion_of(:area).in_array(AdditionalContent::PAGE_AREA) }
  end
end
