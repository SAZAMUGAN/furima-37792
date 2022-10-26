FactoryBot.define do
  factory :tag do
    tag_name { Faker::Lorem.sentence }
    association :item
  end
end
