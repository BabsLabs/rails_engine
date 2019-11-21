require 'rails_helper'

describe "Merchants API" do
  it "sends a list of merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants_check = JSON.parse(response.body)
    expect(merchants_check.values).to_not eq([nil])
  end

  it "sends a single merchant" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}"

    expect(response).to be_successful

    merchant_check = JSON.parse(response.body)
    expect(merchant_check.values).to_not eq([nil])
  end

  it "finds a single merchant by id" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?id=#{merchant.id}"

    expect(response).to be_successful

    merchant_id_check = JSON.parse(response.body)
    expect(merchant_id_check.values).to_not eq([nil])
  end

  it "finds a single merchant by name" do
    merchant = create(:merchant)

    get "/api/v1/merchants/find?name=#{merchant.name}"

    expect(response).to be_successful

    merchant_name_check = JSON.parse(response.body)
    expect(merchant_name_check.values).to_not eq([nil])

  end

  it "finds a single merchant by created date" do
    merchant = create(:merchant, created_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find?created_at=#{merchant.created_at}"

    expect(response).to be_successful

    merchant_created_check = JSON.parse(response.body)
    expect(merchant_created_check.values).to_not eq([nil])
  end

  it "finds a single merchant by updated date" do
    merchant = create(:merchant, updated_at: "2012-03-27 14:53:59 UTC")

    get "/api/v1/merchants/find?updated_at=#{merchant.updated_at}"

    expect(response).to be_successful

    merchant_updated_check = JSON.parse(response.body)
    expect(merchant_updated_check.values).to_not eq([nil])
  end

  it "returns a collection of items associated with that merchant" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful

    merchant_items_check = JSON.parse(response.body)
    expect(merchant_items_check).to_not eq([nil])
  end

  it "returns a collection of invoices associated with that merchant from their known orders" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_successful

    merchant_invoices_check = JSON.parse(response.body)
    expect(merchant_invoices_check).to_not eq([nil])
  end

  it "can return the top x merchants ranked by total revenue" do
    create(:merchant)

    get "/api/v1/merchants/most_revenue"

    expect(response).to be_successful

    merchant_revenue_check = JSON.parse(response.body)
    expect(merchant_revenue_check).to_not eq([nil])
  end
end