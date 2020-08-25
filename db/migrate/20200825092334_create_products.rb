class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :name                  , null: false
      t.string     :image                 , null: false
      t.text       :description           , null: false
      t.integer    :price                 , null: false
      t.string     :user                  , null: false, foreign_key: true
      t.integer    :category_id           , null: false
      t.integer    :condition_id          , null: false
      t.integer    :postage_type_id       , null: false
      t.integer    :prefectures_id        , null: false
      t.integer    :preparation_days_id   , null: false
      t.timestamps
    end
  end
end
