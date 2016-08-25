require 'rails_helper'

RSpec.describe Warehouse, type: :model do

  it "should have inventories" do
    warehouse = Warehouse.create!
    inventory1 = warehouse.inventories.create!
    inventory2 = warehouse.inventories.create!
    expect( warehouse.reload.inventories).to eq([inventory1, inventory2])
  end

  it "should have products through inventories" do
    warehouse = Warehouse.create!
    inventory = warehouse.inventories.create!
    product1 = inventory.products.create!
    product2 = inventory.products.create!
    expect( warehouse.reload.products).to eq([product1, product2])
  end

  it "should have shipments" do
    warehouse = Warehouse.create!
    shipment = warehouse.shipments.create!
    product1 = shipment.products.create!
    product2 = shipment.products.create!
    expect( shipment.reload.products).to eq([product1, product2])
  end

  it "can return count of products by name" do
    warehouse = Warehouse.create!
    inventory = warehouse.inventories.create!
    10.times do
      inventory.products.create! name: "Dog Bed"
    end
    count = inventory.products.where(name: "Dog Bed").count
    expect( warehouse.check_for_product("Dog Bed")).to eq(10)
  end

  it "can return count of 0 products if not instock" do
    warehouse = Warehouse.create!
    inventory = warehouse.inventories.create!
    count = inventory.products.where(name: "Dog Bed").count
    expect( warehouse.check_for_product("Dog Bed")).to eq(0)
  end

end
