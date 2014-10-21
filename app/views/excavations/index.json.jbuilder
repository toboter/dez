json.array!(@excavations) do |excavation|
  json.extract! excavation, :id, :name, :dai_gazetter_id, :shortcut
  json.url excavation_url(excavation, format: :json)
end
