class Api::V1::Transactions::InvoiceController < ApplicationController

  def show
    transaction = Transaction.find(params[:id])
    serialzed_transaction = TransactionInvoiceSerializer.new(transaction)
    render json: serialzed_transaction
  end

end