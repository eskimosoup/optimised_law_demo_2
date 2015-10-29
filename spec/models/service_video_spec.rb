require 'rails_helper'

RSpec.describe ServiceVideo, type: :model do
  it { should belong_to(:video) }
  it { should belong_to(:service) }
end
