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
