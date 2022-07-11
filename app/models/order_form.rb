class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number, :token
  
  validates :token, presence: true
  validates :item_id, presence: true
  validates :user_id, presence: true
  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :item_prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city, presence: true
  validates :addresses, presence: true
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }

  def save
    order_id = Order.create(item_id: item_id, user_id: user_id)
    Shipment.create( postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order: order)
  end
 end