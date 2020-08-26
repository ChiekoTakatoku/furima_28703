class Uesr < ApplicationRecord
  has_many :products
  has_many :purchase_info
end
