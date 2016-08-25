require 'rails_helper'

RSpec.describe ShipmentsController, type: :controller do

  let(:valid_attributes) {}
  let(:invalid_attributes) {}
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all shipments as @shipments" do
      warehouse = Warehouse.create!
      shipment =  warehouse.shipments.create! valid_attributes
      get :index
      expect(assigns(:shipments)).to eq([shipment])
    end
  end

  describe "GET #show" do
    it "assigns the requested shipment as @shipment" do
      warehouse = Warehouse.create!
      shipment =  warehouse.shipments.create! valid_attributes
      get :show, id: shipment.id
      expect(assigns(:shipment)).to eq(shipment)
    end
  end

  describe "GET #new" do
    it "assigns a new shipment as @shipment" do
      get :new
      expect(assigns(:shipment)).to be_a_new(Shipment)
    end
  end

  describe "GET #edit" do
    it "assigns the requested shipment as @shipment" do
      warehouse = Warehouse.create!
      shipment =  warehouse.shipments.create! valid_attributes
      get :edit, id: shipment.id
      expect(assigns(:shipment)).to eq(shipment)
    end
  end

end
