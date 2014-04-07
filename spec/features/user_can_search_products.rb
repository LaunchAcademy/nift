require 'spec_helper'

feature 'user can search products', %q{
  As a visitor
  I want to be able to find a
  specific product through a search form.
} do

# Acceptance criteria
#--------------------
#* I can view a search box on every page in the site
#* I can easily find the search box on the page
#* I can specify any keyword, and it will bring up any relevent results in a case-insensitive manner
#* If no results are returned I see a message

  scenario 'A user can conduct a search' do

    FactoryGirl.create_list(:product, 10)
    FactoryGirl.create(:product, name: "Mac")
    visit root_path
    fill_in 'query', with: "Mac"
    click_button 'Submit'

    expect(page).to have_content('Mac')
    expect(page).to_not have_content('Portable Iceberg Lettuce Synthetic Grinder')
  end
end


