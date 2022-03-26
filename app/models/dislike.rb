class Dislike < ApplicationRecord
  validates :user, uniqueness: { scope: :post_id }
  belongs_to :user
  belongs_to :post, counter_cache: true
end
