class TransactionsController < ApplicationController
  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = @logged_user.transactions.includes(:account)
  end
end
