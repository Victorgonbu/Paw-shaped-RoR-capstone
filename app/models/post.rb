class Post < ApplicationRecord
  belongs_to :user
  has_many :paws
  has_many :votes
  has_many :category_relations
  has_many :categories, through: :category_relations
end
