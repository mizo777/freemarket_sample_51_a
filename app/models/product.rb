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

  class << self
    def ladies_products
      ladies = []
      all.each do |product|
        if product.category.parent.parent.id == 1
          ladies << product
        end
      end
      return ladies
    end
    def mens_products
      mens = []
      all.each do |product|
        if product.category.parent.parent.id == 2
          mens << product
        end
      end
      return mens
    end
    def babys_and_kids_products
      babys_and_kids = []
      all.each do |product|
        if product.category.parent.parent.id == 3
          babys_and_kids << product
        end
      end
      return babys_and_kids
    end
    def cosmetics_and_perfume_and_beauty_products
      cosmetics_and_perfume_and_beauty = []
      all.each do |product|
        if product.category.parent.parent.id == 7
          cosmetics_and_perfume_and_beauty << product
        end
      end
      return cosmetics_and_perfume_and_beauty
    end
  end
end
