class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: {minimum: 0}


  belongs_to :user
  belongs_to :company
  has_many :categorizations
  has_many :categories, through: :categorizations
  accepts_nested_attributes_for :company

end
