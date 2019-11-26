class Api::V1::Invoices::InvoiceItemsController < ApplicationController

  def index
    invoice = Invoice.find(params[:id])
    serialzed_invoice = InvoiceInvoiceItemsSerializer.new(invoice)
    render json: serialzed_invoice
  end

end