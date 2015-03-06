class HomeController < ApplicationController
  def index
    @balance = current_user.account.balance
    # @transaction_history = Account.current_user_account.transactions
  end

  def minor
    @wire_reference = current_user.account.number
  end

  def qr
    @transaction = Transaction.new
    @qr = RQRCode::QRCode.new( 'my string to generate', :size => 8, :level => :h )
  end

end
