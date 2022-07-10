FactoryBot.define do
  factory :order_form do

    postal_code         { '123-4567' }
    item_prefecture_id  { '2' }
    city                { '夏山市夏区' }
    addresses           { '夏山1-2-3' }
    building            { 'サマーハイツ101' }
    phone_number        { '09012345678' }
    token               {"tok_abcdefghijk00000000000000000"}

  end
end
