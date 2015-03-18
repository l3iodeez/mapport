json.array!(@materials) do |material|
  json.extract! material, :id, :materialtype, :color, :hanum, :acm_category, :numsamp, :sqft, :batchnum, :comments
  json.url material_url(material, format: :json)
end
