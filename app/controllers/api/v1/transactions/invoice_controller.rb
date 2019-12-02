class Api::V1::Transactions::InvoiceController < ApplicationController

  def show
    transaction = Transaction.find(params[:id])
    serialzed_transaction = InvoiceSerializer.new(transaction.invoice)
    render json: serialzed_transaction
  end

end