json.array!(@vocabularies) do |vocabulary|
  json.extract! vocabulary, :id, :record_type, :parent_id
  json.url vocabulary_url(vocabulary, format: :json)
end
