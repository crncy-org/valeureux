json.array!(@accounts) do |account|
  json.extract! account, :id, :number
  json.url account_url(account, format: :json)
end
