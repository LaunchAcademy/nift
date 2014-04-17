require 'spec_helper'

describe Vote do
  context "validations" do
    before(:each) do
      FactoryGirl.create(:vote)
    end
    it { should validate_presence_of(:value) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:review_id) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:review_id) }
  end

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:review) }
  end

end
