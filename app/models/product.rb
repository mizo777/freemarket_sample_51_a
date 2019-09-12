class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, presence: true  
  validates :price, presence: true  
  validates :category_id, presence: true  
  validates :user_id, presence: true  
  validates :size, presence: true  
  validates :state, presence: true  
  validates :delivery_burden, presence: true  
  validates :delivery_way, presence: true  
  validates :delivery_from, presence: true  
  validates :delivery_time, presence: true  
  
  has_one :order
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  has_many :product_images, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to_active_hash :region
  accepts_nested_attributes_for :product_images

  enum shoes_size: {"20cm以下": 0, "20.5cm": 1, "21cm": 2, "21.5cm": 3, "21.5cm": 4, "22cm": 5, "22.5cm": 6, "23cm": 7, "23.5cm": 8, "24cm": 9, "24.5cm": 10, "25cm": 11, "25.5cm": 12, "26cm": 13, "26.5cm": 14, "27cm": 15, "27.5cm以上": 16 }
  enum tshirts__size: {"XXS以下": 0, "XS(SS)": 1, "S": 2, "M": 3, "L": 4, "XL(LL)": 5, "2XL(3L)": 6, "3XL(4L)": 7, "4XL(5L)以上": 8, "FREE SIZE": 9}
  enum status: { exhibiting: 0, stop_exhibit: 1, exhibit_trading: 2, exhibited: 3 }
  def toggle_status!
    if exhibiting?
      stop_exhibit!
    else
      exhibiting!
    end
  end  

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
