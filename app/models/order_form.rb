class OrderForm

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :item_id
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :house_number
    validates :phone_number
  end

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
    validates :house_number
  end

  validates :phone_number, numericality: { only_integer: true }
  validates :prefecture_id, numericality: { other_than: 0 }
  
  def save
    itemorder  = ItemOrder.create!(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, item_order_id: itemorder.id)
  end
end