class TopupsController < InheritedResources::Base

 before_action :set_topup, only: [:index, :show]

  # GET /topup
  # GET /topup.json
  def index
    @topups = Topup.all
  end

  # GET /topup/1
  # GET /topup/1.json
  def show
  end

  # GET /topup/new
  def new
    @topup = Topup.new
    @accounts = Account.all
  end

  # GET /topup/1/edit
  # def edit
  # end

  def create
    @topup = Topup.new(topup_params)
    @topup.status = "confirmed"
    @topup.reference = "test"
    respond_to do |format|
      if @topup.save
        format.html { redirect_to @topup, notice: 'topup was successfully created.' }
        format.json { render action: 'show', status: :created, location: @topup }
      else
        format.html { render action: 'new' }
        format.json { render json: @topup.errors, status: :unprocessable_entity }
      end
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_topup
      @topup = Topup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topup_params
      params.require(:topup).permit(:amount, :receiver_id, :reference, :status, :admin_user_id)
    end

end

