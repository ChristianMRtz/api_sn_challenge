class User < ApplicationRecord
  has_secure_password

  has_many :posts,    dependent: :destroy
  has_many :comments

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  validates :lastname, presence: true
end
