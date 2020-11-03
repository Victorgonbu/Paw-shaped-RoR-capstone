class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :votes, through: :posts

  scope :ordered, -> { order(priority: :asc) }
end
