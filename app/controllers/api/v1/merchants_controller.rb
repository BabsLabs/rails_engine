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

  def find
    merchant = Merchant.find_by("#{params.keys.first} = '#{params.values.first}'")
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

  def find_all
    merchant = Merchant.where("#{params.keys.first} = '#{params.values.first}'")
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

  def random
    merchant = Merchant.find(rand(1..Merchant.count))
    serialized_merchant = MerchantSerializer.new(merchant)
    render json: serialized_merchant
  end

end