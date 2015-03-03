class Transaction < ActiveRecord::Base
  belongs_to :sender, :class_name => 'Account'
  belongs_to :receiver, :class_name => 'Account'

  TYPE = ["transfer","payment"]

end

