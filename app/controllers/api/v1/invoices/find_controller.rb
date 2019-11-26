class Api::V1::Invoices::FindController < ApplicationController

  def index
    invoices = Invoice.where("#{params.keys.first} = '#{params.values.first}'").order(:id)
    serialized_invoices = InvoiceSerializer.new(invoices)
    render json: serialized_invoices
  end

  def show
    invoice = Invoice.find_by("#{params.keys.first} = '#{params.values.first}'")
    serialized_invoice = InvoiceSerializer.new(invoice)
    render json: serialized_invoice
  end

end