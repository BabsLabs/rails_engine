class Api::V1::Merchants::MostRevenueController < ApplicationController

  def index
    top_merchants = Merchant.most_revenue(params.values.first)
    serialized_top_merchants = MerchantSerializer.new(top_merchants)
    render json: serialized_top_merchants
  end

end