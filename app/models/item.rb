class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category

  has_many :items
  has_many :orders
  has_one_attached :image

  validates :image, presence: true
  validates :item_name, presence: true
  validates :item_info, presence: true
  validates :item_price, presence: true

  validates :item_category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}

end
