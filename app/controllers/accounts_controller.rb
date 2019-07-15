class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy, :operation]


  def initialize
    super
    @account_service = AccountService.new
  end

  def operation
    @errors = []
    data = params.permit(:amount, :desc, :button)

    transactionParams = {
      type: data[:button],
      amount: data[:amount],
      desc: data[:desc],
    }
    
    @result_balance = @account.balance
    
    suppress(ErrorBag::ValidationException) do
      @result_balance = @account_service.operation(@account, transactionParams)
    end

    @accountTransactions = @account.transactions

  
    respond_to do |format|
      format.js
    end


  end

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = @logged_user.accounts
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @accountTransactions = @account.transactions
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = @account_service.create(@logged_user)

    redirect_to accounts_path
  end


  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:user_id, :balance)
    end
end
