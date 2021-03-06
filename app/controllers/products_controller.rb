class ProductsController < ApplicationController
  before_action :show_all_instance, only: [ :edit, :show, :destroy]

  def index
    @products = Product.all.order('created_at DESC').first(5)
    @messages = Message.all.order('created_at DESC').first(3)
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.includes(:images)
  end

  private

  def show_all_instance
    @images = Image.where(product_id: params[:id])
    @images_first = Image.where(product_id: params[:id]).first
  end

end