class ItemTagRelation < ApplicationRecord
  belongs_to :item
  belongs_to :tag

  with_options presence: true do
    validates :item_id
    validates :tag_id
  end
end
