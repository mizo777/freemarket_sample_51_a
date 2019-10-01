class OrdersController < ApplicationController
  def show
    @product = Product.find(params[:id])
    order = Order.find_by(product_id: @product.id)
    # ユーザーは自身が購入した商品の取引画面にしか入れないようにする
    if user_signed_in?
      unless ( @product.exhibit_trading? || @product.exhibited? ) && current_user.id == order.buyer_id
        # 直前の画面に戻る
        return_back and return
      end
    else
      # 直前の画面に戻る
      return_back and return
    end
  end
end
