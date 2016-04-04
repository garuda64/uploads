json.array!(@programas) do |programa|
  json.extract! programa, :id, :nombre, :descripcion, :imagen, :url
  json.url programa_url(programa, format: :json)
end
