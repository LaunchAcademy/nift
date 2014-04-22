require 'spec_helper'

feature 'a user resets his/her password', %q{
  As a forgetful user,
  I can reset my password
  because I forget my password all the time
  } do
  # Acceptance criteria
  # *User can click on a ‘forgot password’ link on the login page
  # *User receives an email with password confirmation
  # *User is able to set up a new password

  scenario 'user clicks the reset password option' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    click_on 'Forgot your password?'

  end

end
