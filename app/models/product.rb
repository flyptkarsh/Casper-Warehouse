class Product < ActiveRecord::Base
  belongs_to :inventory
  belongs_to :shipment

  def add_to_shipment(shipment)
    self.update( shipment: shipment, inventory: nil)
    self.save!
  end

end
