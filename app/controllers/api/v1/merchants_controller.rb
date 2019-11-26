class Api::V1::MerchantsController < ApplicationController

  def index
    merchant = Merchant.all
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

  def show
    merchant = Merchant.find(params[:id])
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end
  
end