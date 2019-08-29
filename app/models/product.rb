class Product < ApplicationRecord
  has_one :order
  belongs_to :user
  belongs_to :category
  belongs_to :product_image, dependent: :destroy
  belongs_to :brand
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
