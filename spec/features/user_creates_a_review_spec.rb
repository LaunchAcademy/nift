require 'spec_helper'

feature 'reviewer creates a review', %Q{
  As a reviewer
  I want to post a comment with a ranking
  So I can influence the ranking of the product
} do

  # Acceptance criteria
  # *I can click on a post and write a comment
  # *My comment will determine how popular a product is

  scenario 'A signed-in user can create a review for a product' do
    user    = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product)
    sign_in_as(user)
    visit product_path(product)
    expect(page).to_not have_content('This product is the most awesomest thing lyke...ever...omg.')

    click_on 'Review this product'
    select 5, from: 'Rating'
    fill_in 'Comment', with: 'This product is the most awesomest thing lyke...ever...omg.'
    click_on 'Create Review'

    expect(current_path).to eql(product_path(product))
    expect(page).to have_content('This product is the most awesomest thing lyke...ever...omg.')
    expect(page).to have_content("Your review has been successfully added.")
    expect(page).to have_content(user.username)
    expect(page).to have_content(product.name)
  end

  scenario 'A user must select a rating' do
    user    = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product)
    sign_in_as(user)

    visit product_path(product)
    click_on 'Review this product'
    click_on 'Create Review'

    expect(page).to have_content("Please fill in the required fields.")
    expect(page).to have_content("can't be blank")
  end

  scenario 'a signed out user cannot create a review' do
    product = FactoryGirl.create(:product)

    visit product_path(product)
    expect(page).to have_content(product.name)

    click_on 'Review this product'
    expect(current_path).to eq('/users/sign_in')
  end
end



