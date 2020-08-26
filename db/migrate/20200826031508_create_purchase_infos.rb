class CreatePurchaseInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_infos do |t|
      t.integer    :users_id      , null: false, foreign_key: true
      t.integer    :products_id   , null: false, foreign_key: true
      t.timestamps
    end
  end
end
