class OrderShippingAddress
  include ActiveModel::Model
  attr_accessor :post_code, :ken_name_id, :city_name, :block, :building_name, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :order_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city_name
    validates :block
    validates :phone_number, format: {with: /\A^[0-9]{10,11}$\z/}
  end
  validates :ken_name_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(post_code: post_code, ken_name_id: ken_name_id, city_name: city_name, block: block, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end