json.array!(@general_state_options) do |general_state_option|
  json.extract! general_state_option, :id, :name
  json.url general_state_option_url(general_state_option, format: :json)
end
