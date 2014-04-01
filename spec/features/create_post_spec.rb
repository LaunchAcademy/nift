require 'spec_helper'

feature 'a user creates a new post', %q{
  As a content provider
  I want to create a new post
  so I can share it with the world
} do

#   Acceptance criteria
# * I click a new post button from the welcome page
# * I fill the name of the product_name, url, description, company_name, availability
# * product_name, description and company are required
# * Availability limited to: now, future, tba
# * I choose from a list of categories established by the administrator

  scenario 'get to post page' do
    visit root_path
    click_on 'New Product'
    expect(page).to have_content('Create a New Product')
  end

  scenario 'complete post form' do
    new_product = FactoryGirl.build(:product)
    visit new_products_path
    fill_in 'Product Name',
      with: new_product.name
    fill_in 'Company Name',
      with: company.name
    fill_in 'Company Url',
      with: company.url
    fill_in 'Location',
      with: company.location
    fill_in 'Description',
      with: new_product.description
    fill_in 'Website',
      with: new_product.website
    fill_in 'Price',
      with: product.Price
    select new_product.release_date,
     from: 'Availability'
    click_on 'Submit'
  end

end
