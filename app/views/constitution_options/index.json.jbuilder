json.array!(@constitution_options) do |constitution_option|
  json.extract! constitution_option, :id, :name
  json.url constitution_option_url(constitution_option, format: :json)
end
