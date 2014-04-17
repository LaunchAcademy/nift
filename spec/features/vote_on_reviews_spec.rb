require 'spec_helper'

feature 'user votes on a review', %Q{
  As an active user,
I want to upvote or downvote reviews
So I can influence their ranking
} do

  # Acceptance Criteria:
  # *A signed-in user can vote on any review one time.
  # *A signed-out user cannot vote on reviews
  # *There is an option next to each review to upvote or downvote it.

  describe "a signed-in user can upvote on a review" do


    scenario "can be upvoted" do

      sign_in_as(FactoryGirl.create(:user))
      review  = FactoryGirl.create(:review)

      visit product_reviews_path(review.product)
      within('div.review-vote') do
        expect(page).to have_content('0')
        expect(page).to_not have_content('1')
        click_link 'Upvote'
      end

      within('div.review-vote') do
        expect(page).to have_content('1')
        expect(page).to_not have_content('0')
      end
    end

    scenario "can be downvoted" do
      user    = FactoryGirl.create(:user)
      sign_in_as(user)
      product = FactoryGirl.create(:product)
      review  = FactoryGirl.create(:review, product: product)

      visit product_reviews_path(product)
      expect(page).to have_content(review.comment)
      within('div.review-vote') do
        expect(page).to have_content('0')
        expect(page).to_not have_content('-1')
        click_link 'Downvote'
      end

      within('div.review-vote') do
        expect(page).to have_content('-1')
        expect(page).to_not have_content('0')
      end
    end

  end

  scenario "a signed-in user can only vote once per review"
  scenario "a signed-out user cannot vote on reviews"


end
