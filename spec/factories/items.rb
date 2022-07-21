FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    explanation { Faker::Lorem.sentence }
    price                { Faker::Number.between(from: 300, to: 9_999_999) }
    category             { Category.find_by_id 2 }
    condition { Condition.find_by_id 2 }
    burden_of_shipping_charges { BurdenOfShippingCharges.find_by_id 2 }
    ken_name { KenName.find_by_id 2 }
    days_to_ship { DaysToShip.find_by_id 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
