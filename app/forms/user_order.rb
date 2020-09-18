class UserOrder

  include ActiveModel::Model
  attr_accessor :nickname, :email, :password, :password_confirmation, :birthday,
                :first_name, :family_name, :first_name_kana, :family_name_kana,
                :postal_code, :prefecture_id, :city, :address, :building, :phone_number,
                :product_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\d{1,4}/ }
    
    validates :user_id
    validates :product_id
  end
  

  def save
    order = Order.create(product_id: product_id, user_id: user_id)
    UserAddress.create(postal_code: postal_code, city: city, address: address, phone_number: phone_number, prefecture_id: prefecture_id, order_id: order.id)
  end

end