class CreatePurchaseInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_infos do |t|
      t.integer    :user_id      , null: false, foreign_key: true
      t.integer    :product_id   , null: false, foreign_key: true
      t.timestamps
    end
  end
end
