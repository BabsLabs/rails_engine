require 'rails_helper'

describe "Merchants API Endpoints" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants_check = JSON.parse(response.body)
    expect(merchants_check.values).to_not eq({"data"=>nil})
  end

  it "sends a single merchant" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful

    merchant_check = JSON.parse(response.body)
    expect(merchant_check.values).to_not eq({"data"=>nil})
  end
end