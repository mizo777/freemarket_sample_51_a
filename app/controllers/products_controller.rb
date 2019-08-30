class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create!(product_params)
  #   if @user.save
  #     render 'index'
  #   else
  #     render 'new'
  #  end    
  end
  
  def purchase_confirmation
  end
end

  private

  def product_params
    params.require(:product).permit(:name, :product_image_id, :detail, :price, :category_id, :brand_id, :state, :delivery_burden, :delivery_from, :delivery_way, :delivery_time, :size)
  end
