class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: {minimum: 0}


  belongs_to :user
  belongs_to :company
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :company

  def self.search(query)
    where('LOWER(name) like LOWER(?) or LOWER(description) like LOWER(?)', query, query)
  end

  paginates_per 20

end
