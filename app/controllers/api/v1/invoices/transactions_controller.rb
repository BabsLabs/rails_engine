class Api::V1::Invoices::TransactionsController < ApplicationController

  def index
    invoices = Invoice.find(params[:id])
    serialized_invoices = InvoiceTransactionsSerializer.new(invoices)
    render json: serialized_invoices
  end

end