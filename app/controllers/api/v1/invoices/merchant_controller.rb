class Api::V1::Invoices::MerchantController < ApplicationController

  def show
    invoice = Invoice.find(params[:id])
    serialzed_invoice = InvoiceMerchantSerializer.new(invoice)
    render json: serialzed_invoice
  end

end