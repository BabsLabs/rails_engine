class Api::V1::InvoiceItems::FindController < ApplicationController

  def show
    invoice = InvoiceItem.find_by("#{params.keys.first} = '#{params.values.first}'")
    serializerd_inovice_item = InvoiceItemSerializer.new(invoice)
    render json: serializerd_inovice_item
  end
end