json.array!(@noticia) do |noticium|
  json.extract! noticium, :id, :titulo, :descripcion, :iframe, :categoria, :publicar, :visible, :usuario
  json.url noticium_url(noticium, format: :json)
end
