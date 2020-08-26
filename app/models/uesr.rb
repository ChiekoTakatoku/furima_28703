class Uesr < ApplicationRecord
  has_many :users_addresses
  has_many :products
end
