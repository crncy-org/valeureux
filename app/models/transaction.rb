class Transaction < ActiveRecord::Base
  belongs_to :sender, :class_name => 'Account'
  belongs_to :receiver, :class_name => 'Account'

  TRANSACTION_TYPE = ["transfer","payment"]

  # after_create do |transaction|
  #   client = Twilio::REST::Client.new
  #   client.messages.create(
  #     from: '+32460200005',
  #     to: '+32478132163',
  #     body: 'You have received money transaction'
  #   )
end

