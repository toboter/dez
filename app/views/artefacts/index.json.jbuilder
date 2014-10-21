json.array!(@artefacts) do |artefact|
  json.extract! artefact, :id, :dez, :dez_index, :dimensions, :dimensions_type, :weight, :in_exhibition, :creator_id, :updater_id
  json.url artefact_url(artefact, format: :json)
end
