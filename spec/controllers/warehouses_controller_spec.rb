require 'rails_helper'

RSpec.describe WarehousesController, type: :controller do

  let(:valid_attributes) { { :name => "Example User" } }
  let(:invalid_attributes) { { :pikachu => "Example User" }  }

  describe "GET #index" do
    it "assigns all warehouses as @warehouses" do
      warehouse = Warehouse.create! valid_attributes
      get :index, params: {}
      expect(assigns(:warehouses)).to eq([warehouse])
    end
  end

  describe "GET #show" do
    it "assigns the requested warehouse as @warehouse" do
      warehouse = Warehouse.create! valid_attributes
      get :show, id: warehouse.id
      expect(assigns(:warehouse)).to eq(warehouse)
    end
  end


  describe "GET #new" do
    it "assigns a new warehouse as @warehouse" do
      get :new
      expect(assigns(:warehouse)).to be_a_new(Warehouse)
    end
  end

  describe "GET #edit" do
    it "assigns the requested warehouse as @warehouse" do
      warehouse = Warehouse.create! valid_attributes
      get :edit, id: warehouse.id
      expect(assigns(:warehouse)).to eq(warehouse)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Warehouse" do
        expect {
          post :create, {:warehouse => valid_attributes}
        }.to change(Warehouse, :count).by(1)
      end

      it "assigns a newly created warehouse as @warehouse" do
        post :create, {:warehouse => valid_attributes}
        expect(assigns(:warehouse)).to be_a(Warehouse)
        expect(assigns(:warehouse)).to be_persisted
      end

      it "redirects to the created warehouse" do
          post :create, {:warehouse => valid_attributes}
        expect(response).to redirect_to(Warehouse.last)
      end
    end
  end
end
