class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :most_liked, -> {group(:post_id).count(:all).max_by { |key, value| value }[0]}
end
