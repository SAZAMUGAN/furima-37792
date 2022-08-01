FactoryBot.define do
  factory :order_shipping_address do
    post_code { '123-4567' }
    ken_name_id { 2 } 
    city_name { '青山市' }
    block { '青山1-1' }
    building_name { '東京ハイツ' }
    phone_number { '0120123456' }
  end
end