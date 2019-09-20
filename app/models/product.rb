class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, presence: true  
  validates :price, presence: true  
  validates :category_id, presence: true  
  validates :user_id, presence: true
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

  enum seller_delivery: { 未定: 0, らくらくメルカリ便: 1, ゆうメール: 2, レターパック: 3, 普通郵便: 4, クロネコヤマト: 5, ゆうパック: 6, クリックポスト: 7, ゆうパケット: 8 }, _prefix: true
  enum buyer_delivery: { 未定: 0, クロネコヤマト: 1, ゆうパック: 2, ゆうメール: 3 }, _prefix: true
  enum shoes_size: {"20cm以下": 0, "20.5cm": 1, "21cm": 2, "21.5cm": 3, "22cm": 4, "22.5cm": 5, "23cm": 6, "23.5cm": 7, "24cm": 8, "24.5cm": 9, "25cm": 10, "25.5cm": 11, "26cm": 12, "26.5cm": 13, "27cm": 14, "27.5cm以上": 15 }
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
        if product.exhibiting? && product.category.parent.parent.id == 1
          ladies << product
        end
      end
      return ladies
    end
    def mens_products
      mens = []
      all.each do |product|
        if product.exhibiting? && product.category.parent.parent.id == 2
          mens << product
        end
      end
      return mens
    end
    def babys_and_kids_products
      babys_and_kids = []
      all.each do |product|
        if product.exhibiting? && product.category.parent.parent.id == 3
          babys_and_kids << product
        end
      end
      return babys_and_kids
    end
    def cosmetics_and_perfume_and_beauty_products
      cosmetics_and_perfume_and_beauty = []
      all.each do |product|
        if product.exhibiting? && product.category.parent.parent.id == 7
          cosmetics_and_perfume_and_beauty << product
        end
      end
      return cosmetics_and_perfume_and_beauty
    end
    def chanel_products
      chanel = []
      all.each do |product|
        if product.exhibiting? && product.brand_id == 1
          chanel << product
        end
      end
      return chanel
    end
    def louis_vuitton_products
      louis_vuitton = []
      all.each do |product|
        if product.exhibiting? && product.brand_id == 3
          louis_vuitton << product
        end
      end
      return louis_vuitton
    end
    def supreme_products
      supreme = []
      all.each do |product|
        if product.exhibiting? && product.brand_id == 4
          supreme << product
        end
      end
      return supreme
    end
    def nike_products
      nike = []
      all.each do |product|
        if product.exhibiting? && product.brand_id == 2
          nike << product
        end
      end
      return nike
    end
  end
end
