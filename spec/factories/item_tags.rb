FactoryBot.define do
  factory :item_tag do
    name { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    price                { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id             { 2 }
    condition_id { 2 }
    burden_of_shipping_charges_id { 2 }
    ken_name_id { 2 }
    days_to_ship_id { 2 }
    tag_name { Faker::Lorem.sentence }    
    # images { Rack::Test::UploadedFile.new("app/assets/images/star.png", "image/png") }
  end
end
