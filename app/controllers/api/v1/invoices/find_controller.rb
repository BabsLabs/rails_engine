class Api::V1::Invoices::FindController < ApplicationController

  def index
    invoices = Invoice.where(invoice_params).order(:id)
    serialized_invoices = InvoiceSerializer.new(invoices)
    render json: serialized_invoices
  end

  def show
    invoice = Invoice.find_by(invoice_params)
    serialized_invoice = InvoiceSerializer.new(invoice)
    render json: serialized_invoice
  end

  private

  def invoice_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end

end