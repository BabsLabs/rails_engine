class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    invoice = Invoice.find(params[:id])
    serialzed_invoice = ItemSerializer.new(invoice.items)
    render json: serialzed_invoice
  end

end