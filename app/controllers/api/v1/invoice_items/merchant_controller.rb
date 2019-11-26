class Api::V1::InvoiceItems::MerchantController < ApplicationController

  def show
    invoice_item = InvoiceItem.find(params[:id])
    serialized_invoice_item = InvoiceItemMerchantSerializer.new(invoice_item)
    render json: serialized_invoice_item
  end

end