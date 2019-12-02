class Api::V1::Merchants::InvoicesController < ApplicationController

  def index
    merchant = Merchant.find(params[:id])
    serialized_merchant = InvoiceSerializer.new(merchant.invoices)
    render json: serialized_merchant
  end
end