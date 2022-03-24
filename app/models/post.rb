class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes
  has_many :dislikes
  belongs_to :user
end
