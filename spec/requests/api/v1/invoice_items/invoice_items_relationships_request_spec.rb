require "rails_helper"

describe "Invoice_items API Relationships Endpoints" do
  it "returns the associated invoice" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)

    get "/api/v1/invoice_items/#{invoice_item.id}/invoice"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data']['type']).to eq('invoice')
    expect(invoice_item_check['data']['attributes']['id']).to eq(invoice.id)
  end

  it "returns the associated item" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item = create(:invoice_item, item_id: item.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)

    get "/api/v1/invoice_items/#{invoice_item.id}/item"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data']['type']).to eq('item')
    expect(invoice_item_check['data']['attributes']['id']).to eq(item.id)
  end
end