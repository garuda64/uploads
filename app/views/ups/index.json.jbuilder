json.array!(@ups) do |up|
  json.extract! up, :id, :usuario, :adjunto
  json.url up_url(up, format: :json)
end
