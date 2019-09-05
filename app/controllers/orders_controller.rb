class OrdersController < ApplicationController
  def new
    @product = Product.find(params[:format])
  end
end
