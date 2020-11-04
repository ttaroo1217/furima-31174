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

  validates :category_id, numericality: { other_than: 0 }
  validates :status_id, numericality: { other_than: 0 }
  validates :delivery_charge_id, numericality: { other_than: 0 }
  validates :area_id, numericality: { other_than: 0 }
  validates :days_id, numericality: { other_than: 0 }
end