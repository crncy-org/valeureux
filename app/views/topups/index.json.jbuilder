json.array!(@topups) do |topup|
  json.extract! topup, :id, :amount, :receiver_id, :reference, :status, :admin_user_id
  json.url topup_url(topup, format: :json)
end
