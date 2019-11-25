class Api::V1::TransactionsController < ApplicationController

  def index
    transactions = Transaction.all
    serialzed_transactions = TransactionSerializer.new(transactions)
    render json: serialzed_transactions
  end

  def show
    transactions = Transaction.find(params[:id])
    serialzed_transaction = TransactionSerializer.new(transactions)
    render json: serialzed_transaction
  end

end