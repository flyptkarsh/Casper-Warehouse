class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :address
      t.string :customer
      t.references :warehouse, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
