class Api::V1::Invoices::CustomerController < ApplicationController

  def show
    invoice = Invoice.find(params[:id])
    serialzed_invoice = InvoiceCustomerSerializer.new(invoice)
    render json: serialzed_invoice
  end

end