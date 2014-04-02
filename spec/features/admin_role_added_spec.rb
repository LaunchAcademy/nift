rspec 'spec_helper'

feature 'admin role added', %q{
  As an admin
  I want to have administrative privelages assigned to my account
  so I can police the site
} do

  scenario 'Admin signs into account' do
    visit '/users/sign_in'
  end

  scenario "user can be assigned the role admin" do


  end
    it "a user may have the role of admin"
    it "allows an admin to login with valid attributes"
    it "give an error message if admin logs in without valid attributes"
    it "tests that the admin redirect is to an Admin page"
