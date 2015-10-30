require 'rails_helper'

RSpec.describe TeamMemberOffice, type: :model do
  describe 'associations', :association do
    it { should belong_to(:team_member) }
    it { should belong_to(:office) }
  end
end
