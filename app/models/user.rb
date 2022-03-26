class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes
  has_many :dislikes

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
