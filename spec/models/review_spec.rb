require 'spec_helper'

describe Review do
  context 'validations' do
    before(:each) do
      FactoryGirl.create(:review)
    end
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:author_id) }
    it { should have_valid(:rating).when(1, 2, 3, 4, 5) }
    it { should_not have_valid(:rating).when(0, 7, -3, 6.5) }
    it { should validate_uniqueness_of(:author_id).scoped_to(:product_id) }
  end

  context 'associations' do
    it { should belong_to(:author) }
    it { should belong_to(:product) }
  end

end
