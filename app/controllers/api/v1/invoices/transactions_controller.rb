class Api::V1::Invoices::TransactionsController < ApplicationController

  def index
    invoices = Invoice.find(params[:id])
    serialized_invoices = TransactionSerializer.new(invoices.transactions)
    render json: serialized_invoices
  end

end