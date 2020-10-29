class Category < ApplicationRecord
  has_many :category_relations, dependent: :destroy
  has_many :posts, through: :category_relations

end
