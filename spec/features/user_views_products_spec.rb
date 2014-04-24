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
  # *The visitor can select alternate sort criteria
  # *The root url sends the user to the display page

  scenario 'a registered user is sent to the index page after signing in' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    expect(current_path).to eq('/')
    expect(page).to have_content('Sign out')
  end

  scenario 'all users see the index page when visiting the root url' do
    visit root_path

    expect(current_path).to eq('/')
    expect(page).to have_content('Sign In')
  end

  scenario 'user sees 15 products displayed on the index page' do
    FactoryGirl.create_list(:product, 16)
    visit root_path

    expect(page).to have_css('img', count: 15)

    click_on '2'
    expect(page).to have_css('img', count: 1)
  end

  scenario 'user changes sort criteria' do
    FactoryGirl.create_list(:product, 20)
    last_product = Product.order(created_at: :desc).take

    visit root_path
    click_on 'Newest'

    within '#productContainer a:first-child' do
      expect(page).to have_content("Portable Iceberg Lettuce Synthetic Grinder " + last_product.id.to_s)
    end
  end
end
