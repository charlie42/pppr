json.array!(@visits) do |visit|
  json.extract! visit, :id, :from, :date, :complaints, :anamnesis, :allerg, :general_state, :diagnosis
  json.url visit_url(visit, format: :json)
end
