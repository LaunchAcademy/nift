class User < ActiveRecord::Base
  validates :user_name, presence: true
  validates :email, presence: true
end
