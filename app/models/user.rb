class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password_digest, presence: true
  has_secure_password
  has_many :networks

end