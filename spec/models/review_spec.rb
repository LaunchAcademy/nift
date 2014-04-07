require 'spec_helper'

describe Review do
  context 'validations' do
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:author_id) }
    it { should have_valid(:rating).when(1, 2, 3, 4, 5) }
    it { should_not have_valid(:rating).when(0, -3, 6, 5.5, 1.3, 2.4)}
  end

  context 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:product) }
  end

end
