json.array!(@spaces) do |space|
  json.extract! space, :id, :spacename, :spaceid, :roomnum, :floor, :roomsqft, :building_id
  json.url space_url(space, format: :json)
end
