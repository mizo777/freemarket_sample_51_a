class LikesController < ApplicationController
  before_action :new_like, only: :create
  before_action :set_like, only: :destroy
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    unless @like.save
      redirect_to product_path(params[:format])
    end
  end

  def destroy
    unless @like.destroy
      redirect_to product_path(params[:id])
    end
  end

  private

  def new_like
    @like = Like.new(user_id: current_user.id, product_id: params[:format])
  end
  
  def set_like
    @like = Like.find_by(user_id: current_user.id, product_id: params[:id])
  end
end
