FactoryBot.define do
  factory :product do
    name                { 'テスト' }
    description         { '商品説明' }
    price               { 115_000 }
    user_id             { 1 }
    category_id         { 2 }
    condition_id        { 2 }
    postage_type_id     { 2 }
    prefecture_id       { 2 }
    preparation_day_id  { 2 }
  end
end
