class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :description
    validates :user
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :area_id
    validates :days_id
    validates :price
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :days_id, numericality: { other_than: 1 }
        
  has_one :item_order
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_charge
  belongs_to :area
  belongs_to :day
end
