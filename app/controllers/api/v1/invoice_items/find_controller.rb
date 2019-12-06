class Api::V1::InvoiceItems::FindController < ApplicationController

  def index
    invoice = InvoiceItem.where(invoice_items_params).order(:id)
    serializerd_inovice_item = InvoiceItemSerializer.new(invoice)
    render json: serializerd_inovice_item
  end

  def show
    invoice = InvoiceItem.find_by(invoice_items_params)
    serializerd_inovice_item = InvoiceItemSerializer.new(invoice)
    render json: serializerd_inovice_item
  end

  private

  def invoice_items_params
    params.permit(:id, :item_id, :invoice_id, :quantity, :unit_price, :created_at, :updated_at)
  end

end