require 'spec_helper'

describe Review do
  describe 'validations' do
    before(:each) do
      FactoryGirl.create(:review)
    end
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:author_id) }
    it { should have_valid(:rating).when(1, 2, 3, 4, 5) }
    it { should_not have_valid(:rating).when(0, 7, -3, 6.5) }
    it { should have_valid(:vote_count).when(1, 2, "3", "4", 5, -2, -10) }
    it { should_not have_valid(:vote_count).when("five", "s3", "twenty-two") }
    it { should validate_uniqueness_of(:author_id).scoped_to(:product_id) }
  end

  describe 'associations' do
    it { should belong_to(:author) }
    it { should belong_to(:product) }
    it { should have_many(:votes) }

    it 'updates product review count when a review is created' do
      product = FactoryGirl.create(:product)
      prior_count = product.reviews_count
      FactoryGirl.create(:review, product: product)
      product.reload

      expect(product.reviews_count).to eq(prior_count + 1)
    end
  end

  describe '#update_product_average_rating' do
    it 'updates product average rating when a review is created' do
      product = FactoryGirl.create(:product)
      review1 = FactoryGirl.create(:review, rating: 5, product: product)
      review2 = FactoryGirl.create(:review, rating: 3, product: product)
      product.reload

      expect(product.average_rating).to eq(4)
    end
  end
end
