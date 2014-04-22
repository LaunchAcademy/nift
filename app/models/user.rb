class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: {case_sensitive: false}
  validates :role, presence: true, inclusion: {in: %w(admin user)}

  has_many :products
  has_many :reviews,
    class_name: 'Review',
    foreign_key: :author_id
  has_many :votes

  def admin?
    role == "admin"
  end

  def has_voted?(review)
    votes.where(review: review).any?
  end
end
