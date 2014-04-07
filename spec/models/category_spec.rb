require 'spec_helper'

describe Category do
  describe 'validations' do
    let(:blank) {['', nil]}
    it {should have_valid(:name).when('Cars')}
    it {should_not have_valid(:name).when(*blank)}
    it {should validate_uniqueness_of(:name)}
  end

  describe 'associations' do
    it {should have_many(:products).through(:categorizations)}
  end
end
