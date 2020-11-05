class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :votes, through: :posts

  scope :ordered, -> { includes([:posts, :votes]).order(priority: :asc) }
end
