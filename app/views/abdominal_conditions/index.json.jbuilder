json.array!(@abdominal_conditions) do |abdominal_condition|
  json.extract! abdominal_condition, :id, :name
  json.url abdominal_condition_url(abdominal_condition, format: :json)
end
