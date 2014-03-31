require 'spec_helper'

describe User do
  describe 'validations' do
    let(:valid_attributes) {{ user_name: 'Batman', email: 'batman@gmail.com', password: '12345678' }}
    let(:user) { User.new(valid_attributes) }

    it 'is valid when given valid attributes' do
      expect(user).to be_valid
    end

    it 'requires a user name' do
      user.user_name = ''
      user.save
      expect(user).not_to be_valid
    end

    it 'requires an email' do
      user.email = ''
      user.save
      expect(user).not_to be_valid
    end

    it 'requires a password' do
      user.password = ''
      user.save
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
  end
end
