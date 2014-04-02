class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :role, presence: true, inclusion: {in: %w(admin user)}

  def admin?
    if role == "admin"
      true
    else
      false
    end
  end

end
