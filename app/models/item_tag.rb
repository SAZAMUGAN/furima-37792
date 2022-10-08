class ItemTag
  include ActiveModel::Model
  attr_accessor :name, :explanation, :category_id, :condition_id, :burden_of_shipping_charges_id, :ken_name_id,:days_to_ship_id, :price, :is_active
  ,:tag_name, :user_id 
  
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
    # 寄付情報を保存し、変数donationに代入する
    donation = Donation.create(price: price, user_id: user_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, donation_id: donation.id)
  end

  
end