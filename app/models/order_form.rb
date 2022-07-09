class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number
  
  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :postal_code, presence: true
  validates :item_prefecture_id, presence: true
  validates :city, presence: true
  validates :phone_number, presence: true

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Shipment.create( postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order: order)
  end
 end