class ProductsController < ApplicationController
  def index
    @ladies_products = Product.where(category_id: 1)
    @ladies_product_image = ProductImage.find(5)
    @mens_products = Product.where(category_id: 2)
    @mens_product_image = ProductImage.find(31)
    @babys_and_kids_products = Product.where(category_id: 3)
    @babys_and_kids_product_image = ProductImage.find(56)
    @cosmetics_and_perfume_and_beauty_products = Product.where(category_id: 7)
    @cosmetics_and_perfume_and_beauty_product_image = ProductImage.find(81)
  end

  def show
  end
  
  def purchase_confirmation
  end
end
