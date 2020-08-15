class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :delete]
  before_action :show_all_instance, only: [ :edit, :show, :destroy]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
    @product = Product.new
    @product.images.new
  end

  def show
    @products = Product.includes(:images)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
      flash[:notice] = '出品が完了しました！'
    else
      flash[:alert] = '必須項目を入力してください'
      render :new
    end
  end

  def show
    @products = Product.includes(:images)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:artist, :title, :year, :format, :made_in, :vinyl, :jacket, :price, :comment_track_list, :label, images_attributes: [:image, :_destroy, :id])
  end

  def show_all_instance
    @images = Image.where(product_id: params[:id])
    @images_first = Image.where(product_id: params[:id]).first
  end

end
