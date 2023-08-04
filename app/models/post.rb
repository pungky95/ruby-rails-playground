class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 100 }, uniqueness: true
  validates :content, presence: true, length: { minimum: 50, maximum: 5000 }
end
