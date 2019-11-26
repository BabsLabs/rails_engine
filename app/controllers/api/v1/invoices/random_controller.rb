class Api::V1::Invoices::RandomController < ApplicationController

  def show
    random_invoice_id = Invoice.pluck(:id).sample
    invoice = Invoice.find(random_invoice_id)
    serialized_invoice = InvoiceSerializer.new(invoice)
    render json: serialized_invoice
  end

end