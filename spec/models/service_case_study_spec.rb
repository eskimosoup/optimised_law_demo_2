require 'rails_helper'

RSpec.describe ServiceCaseStudy, type: :model do
  describe 'associations', :association do
    it { should belong_to(:case_study) }
    it { should belong_to(:service) }
  end
end
