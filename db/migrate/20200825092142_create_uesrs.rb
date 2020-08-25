class CreateUesrs < ActiveRecord::Migration[6.0]
  def change
    create_table :uesrs do |t|
      t.string     :nickname        , null: false
      t.string     :email           , null: false
      t.string     :password        , null: false
      t.string     :first_name      , null: false
      t.string     :family_name     , null: false
      t.string     :first_name_kana , null: false
      t.string     :family_name_kana, null: false
      t.date       :birthday        , null: false
      t.timestamps
    end
  end
end
