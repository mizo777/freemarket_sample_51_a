class MypageController < ApplicationController
  def index
    purchase_products
  end

  def notification
  end
  
  def todo
  end
  
  def like
  end
  
  def exhibit_trading
  end
  
  def exhibiting
  end
  
  def exhibit
  end
  
  def purchase
    purchase_products
  end
  
  def purchased
  end
  
  def news
  end
  
  def review
  end
  
  def contact
  end
  
  def sales
  end
  
  def point
  end
  
  def profile
  end
  
  def delivery_address
  end

  def card
  end

  def card_create
  end
    
  def email_password
  end
  
  def identification
  end
  
  def sms_confirmation
  end

  private
  # ユーザーが購入した商品を表示できるようにする
  def purchase_products
    @orders = Order.where(buyer_id: current_user.id).order(id: "ASC")
    @products = []
    @orders.each do |order|
      product = Product.find_by(id: order.product_id)
      if product.exhibit_trading?
        @products << product
      end
    end
  end
end
