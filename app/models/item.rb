class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :item_order
  belongs_to :user
  has_one_attached :image

  
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :day  


  with_options presence: true do
    validates :name
    validates :description
    validates :image
    validates :price
  end

  validates :price, numericality: true
  validates :price, inclusion: { in: (300..9999999)}

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :area_id
    validates :days_id
  end
end