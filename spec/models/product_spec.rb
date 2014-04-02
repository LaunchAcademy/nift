require 'spec_helper'

describe Product do
  describe 'validations' do
    let(:blank) {['', nil]}
    product = FactoryGirl.build(:product)

    it {should have_valid(:name).when('Batmobile')}
    it {should_not have_valid(:name).when(*blank)}

    it {should have_valid(:description).when('it speaks for itself')}
    it {should_not have_valid(:description).when(*blank)}

    it {should have_valid(:price).when('10.00')}
    it {should_not have_valid(:price).when(*blank)}
    it {should_not have_valid(:price).when('ten')}

    it 'is valid when given valid attributes' do
      expect(product).to be_valid
    end
  end

  describe 'associations' do
    it {should belong_to(:user)}
    it {should belong_to(:company)}
    it {should have_many(:categories).through(:categorizations)}
  end
end
