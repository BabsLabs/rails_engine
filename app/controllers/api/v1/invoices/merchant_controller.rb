class Api::V1::Invoices::MerchantController < ApplicationController

  def show
    invoice = Invoice.find(params[:id])
    serialzed_invoice = MerchantSerializer.new(invoice.merchant)
    render json: serialzed_invoice
  end

end