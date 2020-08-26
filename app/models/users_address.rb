class UsersAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :users
  belongs_to :products

  belongs_to_active_hash :prefectures
end
