class Category < ApplicationRecord
  has_many :category_relations
  has_many :posts, through: :category_relations
  
end
