require 'spec_helper'

describe Company do

  describe 'validations' do
    let(:blank) {['', nil]}
    company = FactoryGirl.build(:company)

    it {should have_valid(:name).when(company.name)}
    it {should_not have_valid(:name).when(*blank)}
    it {should validate_uniqueness_of(:name)}

    it {should have_valid(:location).when(company.location)}
    it {should have_valid(:url).when(company.url)}

    it 'is valid when given valid attributes' do
      expect(company).to be_valid
    end
  end

  describe 'associations' do
    it {should have_many(:products)}
  end
end
