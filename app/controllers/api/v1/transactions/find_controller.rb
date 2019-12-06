class Api::V1::Transactions::FindController < ApplicationController

  def index
    transaction = Transaction.where(transactions_params).order(:id)
    serialzed_transaction = TransactionSerializer.new(transaction)
    render json: serialzed_transaction
  end

  def show
    transaction = Transaction.find_by(transactions_params)
    serialzed_transaction = TransactionSerializer.new(transaction)
    render json: serialzed_transaction
  end

  private

  def transactions_params
    params.permit(:id, :invoice_id, :credit_card_number, :result, :created_at, :updated_at)
  end

end