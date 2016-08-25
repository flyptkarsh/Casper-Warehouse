require 'rails_helper'

RSpec.describe Shipment, type: :model do

  it "should be associated with a warehouse" do
    no_warehouse_team = Shipment.new(:warehouse => nil)
    no_warehouse_team.should_not be_valid
  end

  it "should have many products" do
    warehouse = Warehouse.create!
    shipment = warehouse.shipments.create!
    product1 = shipment.products.create!
    product2 = shipment.products.create!
    expect( shipment.reload.products).to eq([product1, product2])
  end

end
