class Topup < ActiveRecord::Base
  belongs_to :receiver, :class_name => 'Account'
  belongs_to :admin_user, :class_name => 'User'

  def transaction_type
    "topup"
  end

  def sender_id
    "N/A"
  end

end
