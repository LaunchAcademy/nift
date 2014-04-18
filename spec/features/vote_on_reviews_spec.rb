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
    let(:user) {FactoryGirl.create(:user)}
    let(:review) {FactoryGirl.create(:review)}

    scenario "can be upvoted" do
      sign_in_as(user)
      visit product_reviews_path(review.product)
      within('div.review-vote') do
        expect(page).to have_content('0')
        expect(page).to_not have_content('1')
        within('div.upvote') do
          click_link 'up'
        end
      end
      within('div.review-vote') do
        expect(page).to have_content('1')
        expect(page).to_not have_content('0')
      end
    end

    scenario "can be downvoted" do
      sign_in_as(user)
      visit product_reviews_path(review.product)
      within('div.review-vote') do
        expect(page).to have_content('0')
        expect(page).to_not have_content('-1')
        within('div.downvote') do
          click_link 'down'
        end
      end
      within('div.review-vote') do
        expect(page).to have_content('-1')
        expect(page).to_not have_content('0')
      end
    end

    scenario "a signed-in user can only vote once per review" do
      sign_in_as(user)
      visit product_reviews_path(review.product)
      within('div.review-vote') do
        expect(page).to have_content('0')
        click_link 'up'
      end
      within('div.review-vote') do
        expect(page).to have_content('1')
        click_link 'up'
      end
      expect(page).to have_content('My bad! You may have already voted. It not, please sign in.')
      within('div.review-vote') do
        expect(page).to have_content('1')
      end
    end

    scenario "a signed-out user cannot vote on reviews" do
      visit product_reviews_path(review.product)
      within('div.review-vote') do
        expect(page).to have_content('0')
        click_link 'up'
      end
      expect(page).to have_content('My bad! You may have already voted. It not, please sign in.')
      within('div.review-vote') do
        expect(page).to have_content('0')
      end
    end
  end
end























