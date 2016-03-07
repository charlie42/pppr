json.array!(@subcutanious_fat_options) do |subcutanious_fat_option|
  json.extract! subcutanious_fat_option, :id, :name
  json.url subcutanious_fat_option_url(subcutanious_fat_option, format: :json)
end
