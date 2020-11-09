class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :votes, through: :posts

  scope :ordered, -> { includes(%i[posts votes]).order(priority: :asc) }

  def most_recent
    posts.order(created_at: :desc).first
  end
end
