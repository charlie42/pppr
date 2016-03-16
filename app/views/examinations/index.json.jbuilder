json.array!(@examinations) do |examination|
  json.extract! examination, :id, :name
  json.url examination_url(examination, format: :json)
end
