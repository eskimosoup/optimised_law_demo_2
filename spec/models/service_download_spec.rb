require 'rails_helper'

RSpec.describe ServiceDownload, type: :model do
  describe 'associations', :association do
    it { should belong_to(:download) }
    it { should belong_to(:service) }
  end
end
