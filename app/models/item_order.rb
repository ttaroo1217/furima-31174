class ItemOrder < ApplicationRecord
  has_one :shipping_address
  belongs_to :user
  belongs_to :item
  # has_one_attached :image
end
