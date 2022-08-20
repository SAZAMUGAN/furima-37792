class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many_attached :images
  belongs_to :user
  has_one :order
  belongs_to :category
  belongs_to :condition
  belongs_to :burden_of_shipping_charges
  belongs_to :ken_name
  belongs_to :days_to_ship
  has_many :comments

  validates :images, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: 'は1枚以上5枚以下にしてください' }

  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }

  validates :category_id, numericality: { other_than: 1, message: 'が選択されていません' }
  validates :condition_id, numericality: { other_than: 1, message: 'が選択されていません' }
  validates :burden_of_shipping_charges_id, numericality: { other_than: 1, message: 'が選択されていません' }
  validates :ken_name_id, numericality: { other_than: 1, message: 'が選択されていません' }
  validates :days_to_ship_id, numericality: { other_than: 1, message: 'が選択されていません' }
end
