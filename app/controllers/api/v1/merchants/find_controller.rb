class Api::V1::Merchants::FindController < ApplicationController

  def index
    merchant = Merchant.where(merchants_params)
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

  def show
    merchant = Merchant.find_by(merchants_params)
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

  private

  def merchants_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end