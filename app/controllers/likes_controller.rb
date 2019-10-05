class LikesController < ApplicationController
  before_action :set_like , only: :destroy

  def create
    like = Like.create(user_id: current_user.id, product_id: params[:format])
    # if like.save
    #   redirect_to product_path(params[:format])
    # else
    #   redirect_to root_path
    # end
    # if like.save
    #   redirect_to product_path
    # else
    #   redirect_to root_path
    # end
    # binding.pry
  end

  def destroy
    unless @like.destroy
      redirect_to product_path(params[:id])
    end
  end

  private
  
  def set_like
    @like = Like.find_by(user_id: current_user.id, product_id: params[:id])
  end
end
