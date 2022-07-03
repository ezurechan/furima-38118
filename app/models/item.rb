class Item < ApplicationRecord
  has_many :items
  has_many :orders
  has_one_attached :image
end
