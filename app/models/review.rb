class Review < ActiveRecord::Base

  RATING_VALUES = [1, 2, 3, 4, 5]

  validates :rating, presence: true, inclusion: 1..5
  validates_numericality_of :rating, :only_integer => true
  validates :author_id, presence: true
  validates :product_id, presence: true

  belongs_to :user,
    class_name: 'User',
    foreign_key: :author_id
  belongs_to :product

end
