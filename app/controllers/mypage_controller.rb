class MypageController < ApplicationController
  before_action :set_user
  
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
    purchase_products
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
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to card_create_mypage_index_path
    else
      Payjp.api_key = Settings.key[:payjp_secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
      # 登録しているカード会社のブランドアイコンを表示する
      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.png"
      when "JCB"
        @card_src = "JCB.png"
      when "MasterCard"
        @card_src = "mastercard.png"
      when "American Express"
        @card_src = "americanExpress.png"
      when "Diners Club"
        @card_src = "dinersClub.png"
      when "Discover"
        @card_src = "discover.png"
      end
    end
  end

  def card_create
    card = Card.where(user_id: current_user.id)
    redirect_to card_mypage_index_path if card.exists?
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
    @purchase_products = []
    @purchased_products = []
    @orders.each do |order|
      product = Product.find_by(id: order.product_id)
      if product.exhibit_trading?
        @purchase_products << product
      elsif product.exhibited?
        @purchased_products << product
      end
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
