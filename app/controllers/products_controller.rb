class ProductsController < ApplicationController
  def index
    @products = Product.all
    @ladies_products = []
    @mens_products = []
    @babys_and_kids_products = []
    @cosmetics_and_perfume_and_beauty_products = []
    @products.each do |product|
      if product.category.parent.parent.id == 1
        @ladies_products << product
      elsif product.category.parent.parent.id == 2
        @mens_products << product
      elsif product.category.parent.parent.id == 3
        @babys_and_kids_products << product
      else @cosmetics_and_perfume_and_beauty_products == 7
        @cosmetics_and_perfume_and_beauty_products << product
      end
    end
    @chanel_products = Product.where(brand_id: 1)
    @louis_vuitton_products = Product.where(brand_id: 3)
    @supreme_products = Product.where(brand_id: 4)
    @nike_products = Product.where(brand_id: 2)
  end

  def show
    @product = Product.find(params[:id])
    @random_products = Product.order("RAND()").limit(2)
    @same_brand_products = Product.where(brand_id: @product.brand_id).where.not(id: params[:id]).order("RAND()").limit(6)
    @exhibitor_related_products = Product.where(user_id: @product.user_id).where.not(id: params[:id]).order("RAND()").limit(6)
  end
  
  def purchase_confirmation
  end
end
