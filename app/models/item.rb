class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :burden_of_shipping_charges
  belongs_to :ken_name
  belongs_to :days_to_ship
  

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :burden_of_shipping_charges_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ken_name_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }
end
