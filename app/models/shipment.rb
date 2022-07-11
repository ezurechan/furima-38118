class Shipment < ApplicationRecord
  belongs_to :order
  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :item_prefecture_id, presence: true, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city, presence: true
  validates :addresses, presence: true
  validates :phone_number, presence: true
  validates :order, presence: true
  
end
