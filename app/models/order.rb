class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_one :user_address

  attr_accessor :token
end
