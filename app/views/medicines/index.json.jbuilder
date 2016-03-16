json.array!(@medicines) do |medicine|
  json.extract! medicine, :id, :name, :code
  json.url medicine_url(medicine, format: :json)
end
