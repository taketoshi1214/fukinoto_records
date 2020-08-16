class Admins::ProductsController < Admins::ApplicationController

  before_action :show_all_instance, only: [ :edit, :show, :destroy]

  def new
    @product = current_admin.products.build
    @product.images.new
  end

  def create
    @product = current_admin.products.build(product_params)
    if @product.save
      redirect_to root_path
      flash[:notice] = '出品が完了しました！'
    else
      flash[:alert] = '必須項目を入力してください'
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:artist, :title, :year, :format, :made_in, :vinyl, :jacket, :price, :comment_track_list, :label, images_attributes: [:image, :_destroy, :id])
  end

  def show_all_instance
    @images = Image.where(product_id: params[:id])
    @images_first = Image.where(product_id: params[:id]).first
  end

end