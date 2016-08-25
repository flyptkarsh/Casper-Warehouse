require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  let(:valid_attributes) {}
  let(:invalid_attributes) {}
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all products as @products" do
      warehouse = Warehouse.create!
      inventory = warehouse.inventories.create!
      product =  inventory.products.create! valid_attributes
      products = Product.all
      get :index
      expect(assigns(:products)).to eq(products)
    end
  end

  describe "GET #show" do
    it "assigns the requested product as @product" do
      warehouse = Warehouse.create!
      inventory = warehouse.inventories.create!
      product =  inventory.products.create! valid_attributes
      get :show, id: product.id
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "GET #new" do
    it "assigns a new product as @product" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "GET #edit" do
    it "assigns the requested product as @product" do
      warehouse = Warehouse.create!
      inventory = warehouse.inventories.create!
      product =  inventory.products.create! valid_attributes
      get :edit, id: product.id
      expect(assigns(:product)).to eq(product)
    end
  end
end
