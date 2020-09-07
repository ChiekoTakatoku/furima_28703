class ProductsController < ApplicationController
  def index
    # @products = Product.order("created_at DESC")
  end

  def new
    if user_signed_in?
      @product = Product.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :description, :price, :category_id, :condition_id, :postage_type_id, :prefectures_id, :preparation_days_id).merge(user_id: current_user.id)
  end
end