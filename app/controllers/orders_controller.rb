class OrdersController < ApplicationController

  # def new
  #   @product = Product.find(params[:format])
  # end

  def show
    @product = Product.find(params[:id])
    order = Order.find_by(product_id: @product.id)
    if user_signed_in?
      unless @product.exhibit_trading? && current_user.id == order.buyer_id
        return_back and return
      end
    else
      return_back and return
    end
  end

  # def create
  #   @order = Order.new(order_params)
  #   if @order.save
  #     redirect_to action: :show, id: @order.product_id
  #   else
  #     redirect_to controller: :products ,action: :buy
  #   end
  # end

  # private

  # def order_params
  #   #@product = Product.find(params[:product_id])
  #   params.require(:order).permit( product_id: params[:product_id], buyer_id: current_user.id )
  # end
end
