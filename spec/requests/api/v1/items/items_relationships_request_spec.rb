require 'rails_helper'

describe "Items API Relationship Endponts" do
  it "returns a collection of associated invoice items" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:invoice_item, 5, item_id: item.id, invoice_id: invoice.id)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_successful

    items_invoice_items_check = JSON.parse(response.body)
    expect(items_invoice_items_check).to_not eq({"data"=>nil})
    expect(items_invoice_items_check['data']['relationships']['invoice_items']['data'].length).to eq(5)
  end

  it "returns the associated merchant" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful

    items_invoice_items_check = JSON.parse(response.body)
    expect(items_invoice_items_check).to_not eq({"data"=>nil})
  end
end