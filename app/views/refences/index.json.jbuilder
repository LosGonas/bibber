json.array!(@refences) do |refence|
  json.extract! refence, :id
  json.url refence_url(refence, format: :json)
end
