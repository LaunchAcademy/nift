require 'spec_helper'

feature 'user views one product', %q{
  As a visitor
  I want to view a product's page
  So I can see it in detail and read or post comments
} do

  # Acceptance criteria

  # *clickin a product image on the index page opens the product page
  # *The product image is displayed
  # *The review is displayed
  # *Comments are displayed

  scenario 'a user is sent to a product page from the index page' do
    product = FactoryGirl.create(:product)
    visit root_path
    find(:css, 'a.product_image').click

    expect(page).to have_css('div.product_display_image img')
    expect(page).to have_content('Review this product')
  end
end
