json.array!(@musics) do |music|
  json.extract! music, :id, :index, :show
  json.url music_url(music, format: :json)
end
