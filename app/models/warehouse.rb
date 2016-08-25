class Warehouse < ActiveRecord::Base
  has_many :shipments
  has_many :inventories
  has_many :products, through: :inventories

  def check_for_product(name)
    self.products.where(name: name).count
  end
end
