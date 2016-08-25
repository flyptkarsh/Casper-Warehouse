json.extract! product, :id, :name, :inventory_id, :shipment_id, :created_at, :updated_at
json.url product_url(product, format: :json)