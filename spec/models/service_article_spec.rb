require 'rails_helper'

RSpec.describe ServiceArticle, type: :model do
  describe 'associations', :association do
    it { should belong_to(:article) }
    it { should belong_to(:service) }
  end
end
