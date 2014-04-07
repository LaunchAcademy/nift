require 'spec_helper'

feature 'reset password', %Q{
  As a forgetful user,
  I can reset my password
  because I do this all the time
  } do

  # Acceptance criteria

  # *User can click on a ‘forgot password’ link on the login page
  # *User receives an email with password confirmation
  # *User is able to set up a new password

  scenario 'user clicks the reset password option' do
    visit root_path
    save_and_open_page
  end


end
