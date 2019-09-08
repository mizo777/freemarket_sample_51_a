class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy] 
  def index
    @ladies_products = Product.ladies_products
    @mens_products = Product.mens_products
    @babys_and_kids_products = Product.babys_and_kids_products
    @cosmetics_and_perfume_and_beauty_products = Product.cosmetics_and_perfume_and_beauty_products
    @chanel_products = Product.where(brand_id: 1)
    @louis_vuitton_products = Product.where(brand_id: 3)
    @supreme_products = Product.where(brand_id: 4)
    @nike_products = Product.where(brand_id: 2)
  end

  def show
    @random_products = Product.order("RAND()").limit(2)
    @same_brand_products = Product.where(brand_id: @product.brand_id).where.not(id: params[:id]).order("RAND()").limit(6)
    @exhibitor_related_products = Product.where(user_id: @product.user_id).where.not(id: params[:id]).order("RAND()").limit(6)
  end

  def destroy
    if @product.user_id == current_user.id
      @product.destroy
      redirect_to mypage_index_path
    else
      render :show
    end
  end

  def purchase_confirmation
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
end
