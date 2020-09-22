class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
    validates :password, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
    validates :password_confirmation
    validates :birthday
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/ }
    validates :family_name_kana, format: { with: /\A[ァ-ン]+\z/ }
  end
end
