FactoryBot.define do
  factory :user_order do
    user_id     { 1 }
    product_id  { 5 }

    postal_code    { '123-4567' }
    prefecture_id  { 28 }
    city           { "東京都世田谷区" }
    address        { "5-64-2" }
    building       { "戦国マンション" }
    phone_number   { '08012345678' }

  end
end
