require 'spec_helper'

describe User do
  describe 'validations' do
    let(:blank) {['', nil]}
    user = FactoryGirl.build(:user)

    it {should have_valid(:username).when(user.username)}
    it {should_not have_valid(:username).when(*blank)}

    it {should have_valid(:email).when(user.email)}
    it {should_not have_valid(:email).when(*blank)}

    it {should have_valid(:password).when(user.password)}
    it {should_not have_valid(:password).when(*blank)}
    it {should_not have_valid(:password).when('1234')}

    it 'is valid when given valid attributes' do
      expect(user).to be_valid
    end
  end
end
