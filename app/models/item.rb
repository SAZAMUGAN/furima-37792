class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :purchase_record
  belongs_to :category
  belongs_to :condition
  belongs_to :burden_of_shipping_charges
  belongs_to :ken_name
  belongs_to :days_to_ship
  
  validates :name, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :burden_of_shipping_charges_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :ken_name_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999},
  format: { with: /\A[0-9]+\z/ }

end
