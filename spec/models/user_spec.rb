require 'spec_helper'

describe User do
  context 'validations' do
    let(:blank) {['', nil]}

    user = FactoryGirl.build(:user)
    it { should have_valid(:username).when(user.username) }
    it { should_not have_valid(:username).when(*blank) }
    it { should have_valid(:email).when(user.email) }
    it { should_not have_valid(:email).when(*blank) }
    it { should have_valid(:password).when(user.password) }
    it { should_not have_valid(:password).when(*blank) }
    it { should_not have_valid(:password).when('1234') }
    it 'is valid when given valid attributes' do
      expect(user).to be_valid
    end
    it { should have_valid(:role).when('user', 'admin') }
    it { should_not have_valid(:role).when('toothfairy', 'monkeyface') }
  end


  context 'associations' do
    it { should have_many(:reviews) }
    it { should have_many(:votes) }
  end


  context 'methods' do
    it 'ensures that user is an admin' do
      administrator = FactoryGirl.build(:user, role: "admin")
      expect(administrator.admin?).to eq(true)
    end

    it 'ensures that user is not an admin' do
      user = FactoryGirl.build(:user)
      expect(user.admin?).to eql(false)

      user.role = 'admin'
      expect(user.admin?).to eq(true)
    end
  end
end
