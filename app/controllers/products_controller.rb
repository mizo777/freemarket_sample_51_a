class ProductsController < ApplicationController
  def index
    @ladies_products = Product.where(category_id: 1)
    @mens_products = Product.where(category_id: 2)
    @babys_and_kids_products = Product.where(category_id: 3)
    @cosmetics_and_perfume_and_beauty_products = Product.where(category_id: 7)
    @chanel_products = Product.where(brand_id: 1)
    @louis_vuitton_products = Product.where(brand_id: 3)
    @supreme_products = Product.where(brand_id: 4)
    @nike_products = Product.where(brand_id: 2)
  end

  def show
    @product = Product.find(params[:id])
    @random_products = Product.order("RAND()").limit(2)
    @same_brand_products = Product.where(brand_id: @product.brand_id).where.not(id: params[:id]).order("RAND()").limit(6)
  end
  
  def purchase_confirmation
  end
end
