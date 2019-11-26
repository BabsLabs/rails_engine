require 'rails_helper'

describe "Merchants API Random Endpoint" do
  it "finds a random merchant" do
    create_list(:merchant, 5)

    get "/api/v1/merchants/random"

    expect(response).to be_successful

    merchants_find_random_check = JSON.parse(response.body)
    expect(merchants_find_random_check.values).to_not eq({"data"=>nil})
  end
end