json.array!(@doctors) do |doctor|
  json.extract! doctor, :id, :name, :username, :password, :password_conformation, :specialization
  json.url doctor_url(doctor, format: :json)
end
