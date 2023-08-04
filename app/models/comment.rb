class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :user_id, presence: true
  validates :post_id, presence: true
  validates :comment, presence: true, length: { minimum: 2, maximum: 5000 }
end
