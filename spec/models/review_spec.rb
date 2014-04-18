require 'spec_helper'

describe Review do
  context 'validations' do
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:author_id) }
    it { should have_valid(:rating).when(1, 2, 3, 4, 5) }
    it { should_not have_valid(:rating).when(0, 7, -3, 6.5) }
    it { should have_valid(:vote_count).when(1, 2, "3", "4", 5, -2, -10) }
    it { should_not have_valid(:vote_count).when("five", "s3", "twenty-two") }
    it { should validate_uniqueness_of(:author_id).scoped_to(:product_id) }
  end

  context 'associations' do

    it { should belong_to(:author) }
    it { should belong_to(:product) }
    it { should have_many(:votes) }

    let(:product) {FactoryGirl.create(:product)}
    let(:review) {FactoryGirl.create(:review)}

    it 'updates product popularity when a review is created' do
      prior_count = product.reviews.size
      FactoryGirl.create(:review)

      expect(product.reviews.size).to eq(prior_count + 1)
    end

    describe '#update_product_average_rating' do
      it 'updates product average rating when a review is created' do
        review2 = FactoryGirl.create(:review, rating: 3)

        expect(product.average_rating).to eq((review.rating + review2.rating) / 2)
      end
    end
  end
end
