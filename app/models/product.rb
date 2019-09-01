class Product < ApplicationRecord
  has_one :order
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :product_images, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :state, presence: true
  validates :delivery_burden, presence: true
  validates :delivery_way, presence: true
  validates :delivery_from, presence: true
  validates :delivery_time, presence: true
end
