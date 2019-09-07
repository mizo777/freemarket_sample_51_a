class ProductsController < ApplicationController
  before_action :set_product, only: [:show,:toggle_status, :pay]

  def index
    @products = Product.all
  end

  def new
    @parents = Category.order("id ASC").limit(15)
    @product = Product.new
    @brand = Brand.all
    10.times { @product.product_images.build }    
  end

  def create
    @product = Product.create!(product_params)
    if @product.save
      redirect_to root_path
    else
      render 'new'
   end    
  end

  def pay
    @product.update(status: 2)
    redirect_to @product
  end
  
  def category
    respond_to do |format|
      format.html
      format.json do
       @children = Category.find(params[:parent_id]).children
       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end

  def child_category
    respond_to do |format|
      format.html
      format.json do
       @grandchildren = Category.find(params[:child_id]).children
       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end

  def size_category
    respond_to do |format|
      format.html
      format.json do
       @size = Category.find(params[:grandchild_id]).children
       #親ボックスのidから子ボックスのidの配列を作成してインスタンス変数で定義
      end
    end
  end

  def toggle_status
    @product.toggle_status!
    redirect_to @product
  end


  private

  def product_params
    params.require(:product).permit(:name, :product_image_id, :detail, :price, :category_id, :brand_id, :state, :delivery_burden, :delivery_from, :delivery_way, :delivery_time, :size, product_images_attributes: :image ).merge(user_id: current_user.id)
  end
  
  def set_product
    @product = Product.find(params[:id] || params[:product_id])
  end
end
