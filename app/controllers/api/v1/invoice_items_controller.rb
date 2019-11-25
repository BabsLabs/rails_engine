class Api::V1::InvoiceItemsController < ApplicationController

  def index
    invoice_items = InvoiceItem.all
    serializerd_inovice_items = InvoiceItemSerializer.new(invoice_items)
    render json: serializerd_inovice_items
  end

  def show
    invoice_items = InvoiceItem.find(params[:id])
    serializerd_inovice_items = InvoiceItemSerializer.new(invoice_items)
    render json: serializerd_inovice_items
  end

end