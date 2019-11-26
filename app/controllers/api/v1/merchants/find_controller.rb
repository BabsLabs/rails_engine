class Api::V1::Merchants::FindController < ApplicationController

  def index
    merchant = Merchant.where("#{params.keys.first} = '#{params.values.first}'")
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

  def show
    merchant = Merchant.find_by("#{params.keys.first} = '#{params.values.first}'")
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

end