json.array!(@individuals) do |individual|
  json.extract! individual, :id, :name, :email
  json.url individual_url(individual, format: :json)
end
