class Api::V1::InvoiceItems::ItemController < ApplicationController

  def show
    invoice_item = InvoiceItem.find(params[:id])
    serialized_invoice_item = ItemSerializer.new(invoice_item.item)
    render json: serialized_invoice_item
  end

end