class HomeController < ApplicationController
  def index
    @balance = current_user.account.balance
    @transaction_history = current_user.account.transactions
  end

  def topup
    @wire_reference = current_user.account.number
  end

  def qr
    @transaction = Transaction.new
    @qr = RQRCode::QRCode.new( 'my string to generate', :size => 8, :level => :h )
    @accounts = Account.all
    @incomes_history = current_user.account.incomes
  end

end
