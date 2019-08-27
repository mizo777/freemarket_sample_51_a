class Product < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :category
  belongs_to :brand
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :product_images, dependent: :destroy
end
