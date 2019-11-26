class Api::V1::Merchants::RandomController < ApplicationController

  def show
    random_id = Merchant.pluck(:id).sample(1)
    merchant = Merchant.find(random_id)
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

end