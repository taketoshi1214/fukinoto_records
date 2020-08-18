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

  def edit
  end

  def update
    if product_params[:images_attributes].nil?
      flash[:alert] = '画像を１枚以上入れてください'
      redirect_to edit_product_path
    else
      exit_ids = []
      product_params[:images_attributes].each do |a,b|
        exit_ids << product_params[:images_attributes].dig(:"#{a}",:id).to_i
      end
      ids = Image.where(product_id: params[:id]).map{|image| image.id }
      delete__db = ids - exit_ids
      Image.where(id:delete__db).destroy_all
      @product.touch
      if @product.update(product_params)
         redirect_to root_path
      else
        flash[:alert] = '更新できませんでした'
        render :edit
      end
    end
  end


  private

  def product_params
    params.require(:product).permit(:artist, :title, :year, :format, :made_in, :vinyl, :jacket, :price, :comment_track_list, :label, images_attributes: [:image, :_destroy, :id])
  end

  def show_all_instance
    @product = Product.find(params[:id])
    @images = Image.where(product_id: params[:id])
    @images_first = Image.where(product_id: params[:id]).first
  end

end