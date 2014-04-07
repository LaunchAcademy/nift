require 'spec_helper'

feature 'user_signs_in' do
  scenario 'user successfully signs in' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign In'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Signed in as #{user.username}")
  end

  scenario 'user enters invalid credentials' do
    visit root_path
    click_on 'Sign In'
    fill_in 'Email', with: 'spacely@sprockets.com'
    fill_in 'Password', with: 'abcdefgh'
    click_on 'Sign In'

    expect(current_path).to eq('/users/sign_in')
  end
end
