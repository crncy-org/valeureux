class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy, :show_qr, :confirm, :show_confirm]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new_wire_out
  def new
    @transaction = Transaction.new
    @accounts = Account.all
    @expenses_history = current_user.account.expenses
  end

  # GET /transactions/1/edit
  def edit
  end

  # GET
  def show_confirm
  end

  # POST
  def confirm
    @transaction.receiver = current_user.account
    @transaction.status = "confirmed"
    @transaction.save
    redirect_to home_index_path
    # client = Twilio::REST::Client.new
    # client.messages.create(
    #   from: '+32460200005',
    #   to: User.find_by_account_id(Transaction.find_by_sender_id(@transaction.sender_id)).phone_number,
    #   body: 'You just received a payment in your account!'
    #   )
  end

  def qr
    @transaction = Transaction.new
  end

  # POST /transactions
  # POST /transactions.json
  def qrcreate
    @transaction = Transaction.new(transaction_params)
    @transaction.transaction_type = "qrtransfer"
    @transaction.status = "pending"
    @transaction.receiver = current_user.account


    if @transaction.save
      redirect_to show_qr_transaction_path(@transaction), notice: 'Transaction was successfully created and is currently in status "Pending".'
    else
      render action: 'new'
    end
  end

  def show_qr
    @url = show_confirm_transaction_url(@transaction)
    @qr = RQRCode::QRCode.new( @url, :size => 8, :level => :h )
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.transaction_type = "transfer"
    @transaction.status = "confirmed"
    @transaction.sender = current_user.account
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(@transaction)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:id, :receiver_id, :amount, :communication) #removed the fields that are not rendered in the form
    end
end
