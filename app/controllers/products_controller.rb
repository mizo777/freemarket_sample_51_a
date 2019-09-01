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
  end
  
  def purchase_confirmation
  end
end
