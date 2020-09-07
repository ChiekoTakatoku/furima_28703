class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase_info
  has_one_attached :image

  validates :name, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }
  validates :user_id, presence: true

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  validates :category_id, :condition_id, :postage_type_id, :prefectures_id, :preparation_days_id, numericality: { other_than: 0 }
end
