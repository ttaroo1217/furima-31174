class ShippingAddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_order

  # with_options presence: true do
  #   validates :postal_code
  #   validates :prefecture_id
  #   validates :city
  #   validates :house_number
  #   validates :building_name
  #   validates :phone_number
  # end

  # validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }

  # with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
  #   validates :city
  #   validates :house_number
  #   validates :building_name
  # end

  # validates :phone_number, numericality: true
  # validates :prefecture, numericality: { other_than: 0 }

end
