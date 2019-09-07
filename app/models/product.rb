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

  enum status: { exhibiting: 0, stop_exhibit: 1, exhibit_trading: 2, exhibited: 3 }
  def toggle_status!
    if exhibiting?
      stop_exhibit!
    else
      exhibiting!
    end
  end  
end
