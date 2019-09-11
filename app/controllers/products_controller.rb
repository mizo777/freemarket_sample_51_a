class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :toggle_status, :pay, :buy]

  def index
    @ladies_products = Product.ladies_products
    @mens_products = Product.mens_products
    @babys_and_kids_products = Product.babys_and_kids_products
    @cosmetics_and_perfume_and_beauty_products = Product.cosmetics_and_perfume_and_beauty_products
    @chanel_products = Product.where(brand_id: 1)
    @louis_vuitton_products = Product.where(brand_id: 3)
    @supreme_products = Product.where(brand_id: 4)
    @nike_products = Product.where(brand_id: 2)
  end

  def destroy
    if @product.id == current_user.id
      @product.destroy
    end
    redirect_to mypage_index_path
  end

  def toggle_status
    @product.toggle_status!
    redirect_to @product
  end

  def show
    @random_products = Product.order("RAND()").limit(2)
    @same_brand_products = Product.where(brand_id: @product.brand_id).where.not(id: params[:id]).order("RAND()").limit(6)
    @exhibitor_related_products = Product.where(user_id: @product.user_id).where.not(id: params[:id]).order("RAND()").limit(6)
  end

  def new
    @parents = Category.order("id ASC").limit(15)
    @product = Product.new
    @brands = Brand.all
    10.times { @product.product_images.build }    
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render 'new'
   end    
  end

  def buy
    @random_products = Product.order("RAND()").limit(2)
    @same_brand_products = Product.where(brand_id: @product.brand_id).where.not(id: params[:id]).order("RAND()").limit(6)
    @exhibitor_related_products = Product.where(user_id: @product.user_id).where.not(id: params[:id]).order("RAND()").limit(6)    
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
    params.require(:product).permit(:name, :detail, :price, :category_id, :brand_id, :state, :delivery_burden, :delivery_from, :delivery_way, :delivery_time, :size, product_images_attributes: :image ).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id] || params[:product_id])
  end
end
