class User < ApplicationRecord
  has_many :paws, -> {where post_id: nil}
  has_many :votes
  has_many :posts
end
