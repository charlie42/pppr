json.array!(@effleurage_options) do |effleurage_option|
  json.extract! effleurage_option, :id, :name
  json.url effleurage_option_url(effleurage_option, format: :json)
end
