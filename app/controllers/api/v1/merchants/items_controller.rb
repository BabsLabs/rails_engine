class Api::V1::Merchants::ItemsController < ApplicationController

  def index
    merchant = Merchant.find(params[:id])
    serialized_merchant = MerchantItemsSerializer.new(merchant)
    render json: serialized_merchant
  end
end