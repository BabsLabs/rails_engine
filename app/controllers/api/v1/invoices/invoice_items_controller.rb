class Api::V1::Invoices::InvoiceItemsController < ApplicationController

  def index
    invoice = Invoice.find(params[:id])
    serialzed_invoice = InvoiceItemSerializer.new(invoice.invoice_items)
    render json: serialzed_invoice
  end

end