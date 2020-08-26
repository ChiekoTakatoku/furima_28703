class UsersAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :product

  belongs_to_active_hash :prefectures
end
