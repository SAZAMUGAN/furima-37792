class Tag < ApplicationRecord
  has_many :item
  has_many :items, through:  :item_tag_relations 
  validates :tag_name,  uniqueness: true
end
