class OrdersController < ApplicationController

  def index
    @product = Product.find_by(params[:id])
  end

  def create
    # 複数のテーブルにデータを保存する処理を記入する
    # saveの有無で遷移先を分岐させる
  end

end
