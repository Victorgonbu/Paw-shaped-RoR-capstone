class User < ApplicationRecord
  REGEX = /[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+\z/.freeze
  has_many :paws, -> { where post_id: nil }
  has_many :votes, dependent: :destroy
  has_many :posts, dependent: :destroy
  validates :name, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }, format: { with: REGEX, message: 'invalid' }
end
