class Shipment < ApplicationRecord
  belongs_to :order
  
  validates :postal_code, presence: true
  validates :item_prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city, presence: true
  validates :addresses, presence: true
  validates :phone_number, presence: true
  validates :order, presence: true
  
end
