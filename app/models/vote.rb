class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :most_liked, -> (id) { where(post_id: id).maximum() } 
end
