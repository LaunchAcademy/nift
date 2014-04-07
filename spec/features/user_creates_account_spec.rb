require 'spec_helper'

feature 'user creates an account', %q{
  As a aspiring user
  I want to create an account
  so I can log-in and post and read reviews
} do

  # Acceptance criteria

  # I can enter my username, email and password
  # Email must be unique, all fields are required
  # Confirm email by responding to unique link in confirm email
  # After sign-on I get to the welcome page
  # I am prompted to re-enter my email

  scenario 'user registers with valid information' do
    count = User.count

    visit root_path
    user = FactoryGirl.build(:user)
    click_on 'Sign up'
    fill_out_registration_form(user)
    click_on 'Sign up'

    expect(User.count).to eq(count + 1)
  end

  scenario 'user fills out form incorrectly' do
    fields = ['Username', 'Email', 'user_password']
    user = FactoryGirl.build(:user)

    fields.each do |omitted|
      visit new_user_registration_path
      fill_out_registration_form(user)
      fill_in omitted, with: ''
      click_on 'Sign up'

      expect(page).to have_content("can't be blank")
    end
  end

  scenario 'user enters an invalid password' do
    user = FactoryGirl.build(:user)
    visit new_user_registration_path
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'user_password', with: '1234'
    fill_in 'user_password_confirmation', with: '1234'
    click_on 'Sign up'

    expect(page).to have_content('is too short')
  end
end
