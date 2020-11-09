class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  scope :ordered, -> { includes(:posts).order(priority: :asc) }

  def most_recent
    posts.order(created_at: :desc).first
  end
end
