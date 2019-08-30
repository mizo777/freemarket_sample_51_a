class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order
  belongs_to :user, optional: true
  belongs_to :category
  belongs_to :product_image, dependent: :destroy
  belongs_to :brand
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to_active_hash :region
end
