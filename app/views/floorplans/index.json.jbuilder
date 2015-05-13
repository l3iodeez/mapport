json.array!(@floorplans) do |floorplan|
  json.extract! floorplan, :id
  json.url floorplan_url(floorplan, format: :json)
end
