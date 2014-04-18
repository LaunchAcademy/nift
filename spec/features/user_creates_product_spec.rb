require 'spec_helper'

feature 'a user creates a new product', %q{
  As a content provider
  I want to create a new product
  so I can share it with the world
} do

#   Acceptance criteria
# * I click a new product button from the welcome page
# * I fill the name of the product_name, url, description, company_name, availability
# * product_name, description and company are required
# * I choose from a list of categories established by the administrator

  scenario 'get to product page' do
    visit root_path
    click_on 'New Product'
    expect(page).to have_content('New Product')
  end

  scenario 'complete product form' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    prior_product_count = Product.count
    prior_company_count = Company.count

    click_on 'New Product'
    fill_out_new_product_form
    click_on 'Submit'

    expect(Product.count).to eq(prior_product_count + 1)
    expect(Company.count).to eq(prior_company_count + 1)
    expect(page).to have_content("You just created a new product")
  end

  scenario 'leave fields blank' do
    user = FactoryGirl.create(:user)
    sign_in_as(user)
    click_on 'New Product'
    click_on 'Submit'

    expect(page).to have_content("can't be blank")
  end
end
