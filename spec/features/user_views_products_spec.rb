require 'spec_helper'

feature 'user views products', %q{
  As a visitor
  I want to see a bunch of products on the page, sorted by ranking
  So I can browse the most highly ranked products
} do

  # Acceptance criteria

  # *By default, the products are sorted by rank in descending order
  # *The visitor can go to the next page of products
  # *By default, the page displays 20 products
  # *The root url sends the user to the display page

  scenario 'a logged-in user may see the hompage' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit root_path

    expect(current_path).to eq('/')
    expect(page).to have_css('div.product_image')
    expect(page).to have_content('Sign out')
  end

  scenario 'a signed-out user can view the homepage' do
    visit root_path

    expect(current_path).to eq('/')
    expect(page).to have_css('div.product_image')
    expect(page).to have_content('Sign In')
  end

  scenario 'user sees products displayed on home page' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    visit root_path

    expect(page).to have_css('div.product_image', count: 20)
  end
end
