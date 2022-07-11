FactoryBot.define do
  factory :item do
    association :user

    item_name                   { 'あああ' }
    item_info                   { 'あああ' }
    item_price                  { '1000' }
    item_category_id            { '2' }
    item_prefecture_id          { '2' }
    item_sales_status_id        { '2' }
    item_scheduled_delivery_id  { '2' }
    item_shipping_fee_status_id { '2' }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
