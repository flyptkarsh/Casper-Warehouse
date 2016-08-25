require 'rails_helper'

RSpec.describe Inventory, type: :model do

  it "should be associated with a warehouse" do
    no_warehouse_inventory = Inventory.new(:warehouse => nil)
    no_warehouse_inventory.should_not be_valid
  end

  it "should have many products" do
    warehouse = Warehouse.create!
    shipment = warehouse.shipments.create!
    product1 = shipment.products.create!
    product2 = shipment.products.create!
    expect( shipment.reload.products).to eq([product1, product2])
  end
  
end
