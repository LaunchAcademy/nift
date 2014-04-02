require 'spec_helper'

feature 'admin role added', %q{
  As an admin
  I want to have administrative privelages assigned to my account
  so I can police the site
  } do

    scenario 'Admin signs into an account' do
      user = FactoryGirl.build(:user, role: 'admin')
      visit '/users/sign_in'
      fill_in_form(user)
      click_on 'Sign in'

      expect(user.role).to eql('admin')
      expect(current_path).to eq('/admin/index')
    end



     scenario "a user may have the role of admin" do
     end
    # it "allows an admin to login with valid attributes"
    # it "give an error message if admin logs in without valid attributes"
    # it "tests that the admin redirect is to an Admin page"
end
