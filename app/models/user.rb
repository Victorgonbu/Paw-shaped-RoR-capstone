class User < ApplicationRecord
  has_many :paws
  has_many :votes
  has_many :posts
end
