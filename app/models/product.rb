class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: {minimum: 0}
  validates :image, presence: true

  belongs_to :user
  belongs_to :company
  has_many :categorizations
  has_many :categories, through: :categorizations
  has_many :reviews, dependent: :destroy
  accepts_nested_attributes_for :company

  paginates_per 21
  mount_uploader :image, ImageUploader

  validate :valid_image?

  def valid_image?
    if image.filename && image.filename !~ (/([^\s]+(\.(?i)(jpg|jpeg|png|gif|bmp))$)/)
      errors[:image] << "Invalid image"
    end
  end

  def self.search(query)
    where('LOWER(name) like LOWER(?) or LOWER(description) like LOWER(?)', query, query)
  end

  def update_average_rating
    total = reviews.inject(0) {|sum, review| sum + review.rating}
    count = reviews.size
    update_attributes(average_rating: total.to_f / count.to_f)
  end
end
