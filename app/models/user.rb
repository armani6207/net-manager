class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :networks

end