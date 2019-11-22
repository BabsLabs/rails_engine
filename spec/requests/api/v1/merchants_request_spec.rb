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

  it "finds a single merchant by id" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?id=#{merchant.id}"

    expect(response).to be_successful

    merchant_id_check = JSON.parse(response.body)
    expect(merchant_id_check.values).to_not eq({"data"=>nil})
  end

  it "finds a single merchant by name" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?name=#{merchant.name}"

    expect(response).to be_successful

    merchant_name_check = JSON.parse(response.body)
    expect(merchant_name_check.values).to_not eq({"data"=>nil})

  end

  it "finds a single merchant by created date" do
    merchant = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

    expect(response).to be_successful

    merchant_created_check = JSON.parse(response.body)
    expect(merchant_created_check.values).to_not eq({"data"=>nil})
  end

  it "finds a single merchant by updated date" do
    merchant = create(:merchant, updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

    expect(response).to be_successful

    merchant_updated_check = JSON.parse(response.body)
    expect(merchant_updated_check.values).to_not eq({"data"=>nil})
  end

  it "finds all merchants by id" do
    create_list(:merchant, 5)
    merchant = Merchant.last

    get "/api/v1/merchants/find_all?id=#{merchant.id}"

    expect(response).to be_successful

    merchants_find_all_id_check = JSON.parse(response.body)
    expect(merchants_find_all_id_check.values).to_not eq({"data"=>nil})
  end

  it "finds all merchants by name" do
    create_list(:merchant, 5)
    merchant = Merchant.last

    get "/api/v1/merchants/find_all?name=#{merchant.name}"

    expect(response).to be_successful

    merchants_find_all_name_check = JSON.parse(response.body)
    expect(merchants_find_all_name_check.values).to_not eq({"data"=>nil})
  end

  it "finds all merchants by created_at" do
    create_list(:merchant, 5, created_at: "2012-03-27 14:53:59 UTC")
    merchant = Merchant.last

    get "/api/v1/merchants/find_all?created_at=#{merchant.created_at}"

    expect(response).to be_successful

    merchants_find_all_created_check = JSON.parse(response.body)
    expect(merchants_find_all_created_check.values).to_not eq({"data"=>nil})
  end

  it "finds all merchants by updated_at" do
    create_list(:merchant, 5, updated_at: "2012-03-27 14:53:59 UTC")
    merchant = Merchant.last

    get "/api/v1/merchants/find_all?updated_at=#{merchant.updated_at}"

    expect(response).to be_successful

    merchants_find_all_updated_check = JSON.parse(response.body)
    expect(merchants_find_all_updated_check.values).to_not eq({"data"=>nil})
  end

  it "finds a random merchant" do
    create_list(:merchant, 5)

    get "/api/v1/merchants/random"

    expect(response).to be_successful

    merchants_find_random_check = JSON.parse(response.body)
    expect(merchants_find_random_check.values).to_not eq({"data"=>nil})
  end
end