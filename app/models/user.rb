class User < ApplicationRecord
  has_many :paws, -> {where post_id: nil}
  has_many :votes, dependent: :destroy
  has_many :posts, dependent: :destroy
end
