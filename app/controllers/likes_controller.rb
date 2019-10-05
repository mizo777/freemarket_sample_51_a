class LikesController < ApplicationController
  # before_action :authenticate_user! , only: :create

  def index
    @likes = Like.all
  end

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
end
