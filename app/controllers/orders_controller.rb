class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create, :pay_item]
  before_action :seller_ban

  def index
    @order = UserOrder.new
  end

  def create
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      #binding.pry
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:user_order).permit(
                  :postal_code, :city, :address, :phone_number, :building, :prefecture_id
                  ).merge(user_id: current_user.id, product_id: params[:id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: params[:token],
      currency:'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def seller_ban
    product = Product.find(params[:id])
     if product.user_id == current_user.id
       redirect_to root_path
     end
  end

end
