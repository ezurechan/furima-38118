FactoryBot.define do
  factory :order do
    association :user
    association :item

    item_id  { '2' }
    user_id  { '2' }
    
  end
end
