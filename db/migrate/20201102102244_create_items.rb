class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,           null: false
      t.text :description,      null: false
      t.references :user, foreign_key: true
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :delivery_charge_id, null: false
      t.integer :area_id, null: false
      t.integer :days_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
