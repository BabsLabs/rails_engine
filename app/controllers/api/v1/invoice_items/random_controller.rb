class Api::V1::InvoiceItems::RandomController < ApplicationController

  def show
    random_id = InvoiceItem.pluck(:id).sample
    invoice_item = InvoiceItem.find(random_id)
    serialized_invoice_item = InvoiceItemSerializer.new(invoice_item)
    render json: serialized_invoice_item
  end

end