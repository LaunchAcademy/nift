require 'spec_helper'

feature 'user_signs_out' do
  scenario 'user successfully signs out' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_on 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Sign in'
    click_on 'Sign out'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Sign in')
  end
end


