class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase_info
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :prefectures
  belongs_to_active_hash :preparation_days

  validates :category_id, :condition_id, :postage_type_id, :prefectures_id, :preparation_days_id, numericality: { other_than: 0 }
end
