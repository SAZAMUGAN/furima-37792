class ItemTag
  include ActiveModel::Model
  attr_accessor(:images, :name, :explanation, :category_id, :condition_id, :burden_of_shipping_charges_id,
                :ken_name_id, :days_to_ship_id, :price, :tag_name, :user_id, :is_active, :id, :created_at, :updated_at, :tag_name)

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
    validates :tag_name
  end

  def save
    item = Item.create(images: images, name: name, explanation: explanation, category_id: category_id, condition_id: condition_id, burden_of_shipping_charges_id: burden_of_shipping_charges_id,
                       ken_name_id: ken_name_id, days_to_ship_id: days_to_ship_id, price: price, user_id: user_id)

    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save

    ItemTagRelation.create(item_id: item.id, tag_id: tag.id)
  end

  def update(params, item)
    item.item_tag_relations.destroy_all

    tag_name = params.delete(:tag_name)

    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?

    tag.save if tag_name.present?
    item.update(params)
    ItemTagRelation.create(item_id: item.id, tag_id: tag.id) if tag_name.present?
  end
end
