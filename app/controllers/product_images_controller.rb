class ProductImagesController < ApplicationController
  def destroy
    product_image = ProductImage.find(params[:id])
    product_image.destroy
  end    
end
