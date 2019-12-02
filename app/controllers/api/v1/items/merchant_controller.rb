class Api::V1::Items::MerchantController < ApplicationController

  def show
    item = Item.find(params[:id])
    serialized_item = MerchantSerializer.new(item.merchant)
    render json: serialized_item
  end

end