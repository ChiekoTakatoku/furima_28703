class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create, :pay_item]

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
                  # :nickname, :email, :password, :password_confirmation,
                  # :birthday, :first_name, :family_name, :first_name_kana, :family_name_kana,
                  # :user_id, :product_id, :token,
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

end
