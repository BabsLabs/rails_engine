class Api::V1::InvoiceItems::InvoiceController < ApplicationController

  def show
    invoice_item = InvoiceItem.find(params[:id])
    serialized_invoice_item = InvoiceSerializer.new(invoice_item.invoice)
    render json: serialized_invoice_item
  end

end