class ItemTag
  include ActiveModel::Model
  attr_accessor :images, :name, :explanation, :category_id, :condition_id, :burden_of_shipping_charges_id, :ken_name_id,:days_to_ship_id, :price,:tag_name, :user_id 
  
  with_options presence: true do
    validates :images
    validates :name
    validates :explanation
    validates :images, length: { minimum: 1, maximum: 5, message: 'は1枚以上5枚以下にしてください' }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      format: { with: /\A[0-9]+\z/ }
    validates :category_id, numericality: { other_than: 1, message: 'が選択されていません' }
    validates :condition_id, numericality: { other_than: 1, message: 'が選択されていません' }
    validates :burden_of_shipping_charges_id, numericality: { other_than: 1, message: 'が選択されていません' }
    validates :ken_name_id, numericality: { other_than: 1, message: 'が選択されていません' }
    validates :days_to_ship_id, numericality: { other_than: 1, message: 'が選択されていません' }
    validates :user_id
  end

  def save
    item = Item.create(images: images, name: name, explanation: explanation, category_id: category_id, condition_id: condition_id, burden_of_shipping_charges_id: burden_of_shipping_charges_id,
    ken_name_id: ken_name_id, days_to_ship_id: days_to_ship_id, price: price, user_id: user_id)

    tag = Tag.create(tag_name: tag_name)

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

  
end