class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string     :postal_code, null: false
      t.integer    :item_prefecture_id, null: false
      t.string     :city
      t.string     :addresses
      t.string     :building, null: false
      t.string     :phone_number, null: false
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
