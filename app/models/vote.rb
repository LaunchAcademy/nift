class Vote < ActiveRecord::Base
  validates :value, presence: true
  validates :user_id, presence: true
  validates :review_id, presence: true
  validates_uniqueness_of :user_id, scope: :review_id

  belongs_to :user
  belongs_to :review

  after_save :update_review
  def update_review
   self.review.vote_count += value
   self.review.save
  end

end
