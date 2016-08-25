require 'rails_helper'

RSpec.describe Product, type: :model do
  it "can be associated with a inventory" do
    warehouse = Warehouse.create!
    inventory = warehouse.inventories.create!
    product1 = inventory.products.create!
    expect( inventory.products).to eq([product1])
  end

  it "can be associated with a shipment" do
    warehouse = Warehouse.create!
    shipment = warehouse.shipments.create!
    product1 = shipment.products.create!
    expect( shipment.products).to eq([product1])
  end

  it "can be added to a shipment" do
    warehouse = Warehouse.create!
    inventory = warehouse.inventories.create!
    shipment = warehouse.shipments.create!
    product = inventory.products.create!
    product.add_to_shipment(shipment)
    expect( product.shipment).to eq(shipment)
  end

  it "is removed from inventory when shipped" do
    warehouse = Warehouse.create!
    inventory = warehouse.inventories.create!
    shipment = warehouse.shipments.create!
    product = inventory.products.create!
    product.add_to_shipment(shipment)
    expect( product.inventory ).to eq(nil)
  end
end
