require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do


  let(:valid_attributes) { }
  let(:invalid_attributes) { { :pikachu => "Example User" }  }


  describe "GET #index" do
    it "assigns all inventories as @inventories" do
      inventory = Inventory.all
      get :index
      expect(assigns(:inventories)).to eq(inventory )
    end
  end


  describe "GET #new" do
    it "assigns a new inventory as @inventory" do
      get :new
      expect(assigns(:inventory)).to be_a_new(Inventory)
    end
  end

  describe "GET #edit" do
    it "assigns the requested inventory as @inventory" do
      warehouse = Warehouse.create!
      inventory = warehouse.inventories.create!
      get :edit, id: inventory.id
      expect(assigns(:inventory)).to eq(inventory)
    end
  end

end
