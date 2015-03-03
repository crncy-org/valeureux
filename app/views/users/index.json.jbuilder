json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :salutation, :email, :phone_number, :user_type, :vat_number, :active, :account_id
  json.url user_url(user, format: :json)
end
