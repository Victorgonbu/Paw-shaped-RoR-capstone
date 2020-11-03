class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :paws, dependent: :destroy
  has_many :votes, dependent: :destroy

  has_one_attached :image

end
