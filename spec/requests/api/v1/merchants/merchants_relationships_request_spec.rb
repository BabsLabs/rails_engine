require 'rails_helper'

describe "Merchants API Relationship Endpoints" do
  it "returns a collection of items associated with that merchant" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}/items"

    expect(response).to be_successful

    merchant_items_check = JSON.parse(response.body)
    expect(merchant_items_check).to_not eq({"data"=>nil})
  end

  it "returns a collection of invoices associated with that merchant from their known orders" do
    merchant = create(:merchant)

    get "/api/v1/merchants/#{merchant.id}/invoices"

    expect(response).to be_successful

    merchant_invoices_check = JSON.parse(response.body)
    expect(merchant_invoices_check).to_not eq({"data"=>nil})
  end
end