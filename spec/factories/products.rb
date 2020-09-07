FactoryBot.define do
  factory :product do
    name                {'テスト'}
    description         {'商品説明'}
    price               {115000}
    user_id             {1}
    category_id         {2}
    condition_id        {2}
    postage_type_id     {2}
    prefectures_id      {2}
    preparation_days_id {2}
  end
end
