class Transaction < ActiveRecord::Base
  belongs_to :sender, :class_name => 'Account'
  belongs_to :receiver, :class_name => 'Account'

  TRANSACTION_TYPE = ["transfer","payment"]

end

