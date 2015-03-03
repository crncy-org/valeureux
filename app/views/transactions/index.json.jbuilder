json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :transaction_type, :sender_id, :receiver_id, :amount, :reference, :status, :communication
  json.url transaction_url(transaction, format: :json)
end
