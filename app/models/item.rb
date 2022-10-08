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
  has_many :tags, through: :item_tag_relations

  
end
