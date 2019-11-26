class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    invoice = Invoice.find(params[:id])
    serialzed_invoice = InvoiceItemsSerializer.new(invoice)
    render json: serialzed_invoice
  end

end