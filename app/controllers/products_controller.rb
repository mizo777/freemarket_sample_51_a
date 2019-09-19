class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
    @ladies_products = Product.ladies_products
    @mens_products = Product.mens_products
    @babys_and_kids_products = Product.babys_and_kids_products
    @cosmetics_and_perfume_and_beauty_products = Product.cosmetics_and_perfume_and_beauty_products
    @chanel_products = Product.chanel_products
    @louis_vuitton_products = Product.louis_vuitton_products
    @supreme_products = Product.supreme_products
    @nike_products = Product.nike_products
  end

  def destroy
    if @product.id == current_user.id
      @product.destroy
    end
    redirect_to mypage_index_path
  end

  def toggle_status
    @product.toggle_status!
    redirect_to @product
  end

  def show
    @random_products = Product.where(status: 0).order("RAND()").limit(2)
    @same_brand_products = Product.where(brand_id: @product.brand_id, status: 0).where.not(id: params[:id]).order("RAND()").limit(6)
    @exhibitor_related_products = Product.where(user_id: @product.user_id, status: 0).where.not(id: params[:id]).order("RAND()").limit(6)
  end

  def destroy
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to mypage_index_path
    else
      render :show
    end
  end

  def buy
    @product = Product.find(params[:product_id])
    # ユーザーが出品した商品の購入確認ページには入れないようにする
    if @product.user_id != current_user.id
      card = Card.where(user_id: current_user.id).first
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
    else
      # 直前の画面に戻る
      return_back and return
    end
  end

  def pay
    Payjp.api_key = Settings.key[:payjp_secret_key]
    charge = Payjp::Charge.create(
      amount: params[:price],
      card: params['payjp-token'],
      currency: 'jpy'
    )
    product = Product.find(params[:product_id])
    product.exhibit_trading!
    order = Order.new(product_id: params[:product_id], buyer_id: current_user.id)
    if order.save
      redirect_to controller: :orders, action: :show, id: order.product_id
    else
      redirect_to action: :buy
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
end