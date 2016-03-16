json.array!(@treatment_factors) do |treatment_factor|
  json.extract! treatment_factor, :id, :name
  json.url treatment_factor_url(treatment_factor, format: :json)
end
