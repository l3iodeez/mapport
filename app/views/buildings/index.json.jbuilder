json.array!(@buildings) do |building|
  json.extract! building, :id, :buildingname, :buildingid, :street_address, :locality, :region, :postcode, :customer_id
  json.url building_url(building, format: :json)
end
