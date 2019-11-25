require 'rails_helper'

describe "Invoice Items API Endpoints" do
  it "can send a list of invoice_items" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice.id, quantity: 5, unit_price: 1.00)

    get '/api/v1/invoice_items'

    expect(response).to be_successful

    invoice_items_check = JSON.parse(response.body)
    expect(invoice_items_check).to_not eq({"data"=>nil})
    expect(invoice_items_check['data'].count).to eq(2)
    expect(invoice_items_check['data'].first['type']).to eq('invoice_item')
    expect(invoice_items_check['data'].first['attributes']['id']).to eq(invoice_item_1.id)
    expect(invoice_items_check['data'].last['attributes']['id']).to eq(invoice_item_2.id)
    expect(invoice_items_check['data'].first['attributes']['id']).to_not eq(invoice_item_2.id)
  end

  it "can send a single invoice_item" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice.id, quantity: 5, unit_price: 1.00)

    get "/api/v1/invoice_items/#{invoice_item_1.id}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data']['type']).to eq('invoice_item')
    expect(invoice_item_check['data']['attributes']['id']).to eq(invoice_item_1.id)
    expect(invoice_item_check['data']['attributes']['id']).to_not eq(invoice_item_2.id)
  end
end