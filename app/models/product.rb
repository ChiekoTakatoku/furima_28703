class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :image
    validates :description
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
    validates :user_id
  end

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  validates :category_id, :condition_id, :postage_type_id, :prefecture_id, :preparation_day_id, numericality: { other_than: 0 }
end
