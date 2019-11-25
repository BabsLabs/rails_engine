class Api::V1::Invoices::CustomerController < ApplicationController

  def index
    invoice = Invoice.find(params[:id])
    serialzed_invoice = InvoiceCustomersSerializer.new(invoice)
    render json: serialzed_invoice
  end

end