class Api::V1::Items::InvoiceItemsController < ApplicationController

  def index
    items = Item.find(params[:id])
    serialized_items = InvoiceItemSerializer.new(items.invoice_items)
    render json: serialized_items
  end

end