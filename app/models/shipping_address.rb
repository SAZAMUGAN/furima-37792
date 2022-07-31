class ShippingAddress < ApplicationRecord
  belongs_to: order

  validates :post_code, presence: true
  validates :ken_name_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city_name, presence: true
  validates :block, presence: true
  validates :building_name, presence: true
  validates :phone_number, presence: true

end
