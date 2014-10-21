json.(@artefact, :id, :dez, :dez_index, :dimensions, :dimensions_type, :weight, :in_exhibition, :created_at, :updated_at)
json.other_ids @artefact.artefact_identificators, :id, :name

json.url artefact_url(@artefact)
