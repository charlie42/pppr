json.array!(@liver_conditions) do |liver_condition|
  json.extract! liver_condition, :id, :name
  json.url liver_condition_url(liver_condition, format: :json)
end
