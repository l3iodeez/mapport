json.array!(@customers) do |customer|
  json.extract! customer, :id, :company, :street_address, :region, :postcode
  json.url customer_url(customer, format: :json)
end
