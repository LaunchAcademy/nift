class Review < ActiveRecord::Base

  after_create :update_product_ranking, :update_product_popularity

  RATING_VALUES = [1, 2, 3, 4, 5]

  validates :rating, presence: true, inclusion: {in: RATING_VALUES}
  validates :author_id, presence: true
  validates :product_id, presence: true
  validates :vote_count, numericality: true
  validates_uniqueness_of :author_id, scope: :product_id

  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id
  belongs_to :product
  has_many :votes

  private

  def update_product_ranking

  end

  def update_product_popularity
  end

end
