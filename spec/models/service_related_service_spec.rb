require 'rails_helper'

RSpec.describe ServiceRelatedService, type: :model do
  describe "associations", :associations do
    it { should belong_to(:service) }
    it { should belong_to(:related_service) }
  end
end
