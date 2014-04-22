class Review < ActiveRecord::Base
  after_create :update_product_average_rating

  RATING_VALUES = [1, 2, 3, 4, 5]

  validates :rating, presence: true, inclusion: {in: RATING_VALUES}
  validates :author_id, presence: true
  validates :product_id, presence: true
  validates :vote_count, numericality: true
  validates_uniqueness_of :author_id, scope: :product_id

  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id
  belongs_to :product, counter_cache: true
  has_many :votes

  def vote_count
    votes.sum(:value)
  end

  private

  def update_product_average_rating
    product.update_average_rating
  end
end
