class Category < ApplicationRecord
  has_many :posts
  has_many :votes, through: :posts
end
