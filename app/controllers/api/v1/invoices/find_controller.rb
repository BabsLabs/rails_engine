class Api::V1::Invoices::FindController < ApplicationController

  def show
    invoice = Invoice.find(params[:id])
    serialized_invoice = InvoiceSerializer.new(invoice)
    render json: serialized_invoice
  end

end