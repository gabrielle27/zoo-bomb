json.array!(@zoos) do |zoo|
  json.extract! zoo, :id, :name
  json.url zoo_url(zoo, format: :json)
end
