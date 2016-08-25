json.extract! shipment, :id, :address, :customer, :warehouse_id, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)