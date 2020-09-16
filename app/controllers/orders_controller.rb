class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:id])
  end

  def create
    # 複数のテーブルにデータを保存する処理を記入する
    # saveの有無で遷移先を分岐させる
  end

  private
  def order_params
    params.require(:order).merge(user_id: current_user.id, product_id: params[:product_id])
  end
end
