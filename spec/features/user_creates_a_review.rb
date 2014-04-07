require 'spec_helper'

feature 'reviewer creates a review', %Q{
  As a reviewer
  I want to post a comment with a ranking
  So I can influence the ranking of the product
} do

  # Acceptance criteria
  # *I can click on a post and write a comment
  # *My comment will determine how popular a product is

  scenario 'as an active user I can create a review' do
    product = FactoryGirl.create(:product)
    visit product_reviews_path(product)
    expect(page).to_not have_content('This product is the most awesomest thing lyke...ever...omg.')

    click_on 'New Review'
    fill_in 'Review', with: 'This product is the most awesomest thing lyke...ever...omg.'
    click_on 'Submit'

    expect(current_path).to eql(product_comments_path(product))
    expect(page).to have_content('This product is the most awesomest thing lyke...ever...omg.')
  end



end

