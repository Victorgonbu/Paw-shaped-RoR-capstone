class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :paws, dependent: :destroy
  has_many :votes, dependent: :destroy

  has_one_attached :image

  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: {maximum: 500}
  validates :goal, numericality: { only_integer: true }
  validates :image, presence: true
  validates :category_id, presence: true

end
