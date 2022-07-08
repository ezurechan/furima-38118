class OrderForm
  include ActiveModel::Model
  attr_accessor :item, :user, :postal_code, :item_prefecture_id, :city, :addresses, :building, :phone_number, :order
  
  validates :item, presence: true
  validates :user, presence: true
  validates :postal_code, presence: true
  validates :item_prefecture_id, presence: true
  validates :city, presence: true
  validates :phone_number, presence: true
  validates :order, presence: true

  def save
    Order.create(item: item, user: user,)
    Shipment.create( postal_code: postal_code, item_prefecture_id: item_prefecture_id, city: city, addresses: addresses, building: building, phone_number: phone_number, order: order)
  end
 end