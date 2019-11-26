# Business Intelligence Tests Relating To Merchants
require 'rails_helper'

describe "Merchants Business Intelligence" do
  it "returns the top x merchants ranked by total revenue" do
    merchant_1 = create(:merchant, name: 'Winner Merchant')
    item_1 = create(:item, merchant_id: merchant_1.id)
    customer = create(:customer)
    invoice_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant_1.id)
    create(:invoice_item, invoice_id: invoice_1.id, item_id: item_1.id, quantity: 10, unit_price: 100)
    create(:transaction, invoice_id: invoice_1.id, result: "success")

    merchant_2 = create(:merchant, name: 'Silver Merchant')
    item_2 = create(:item, merchant_id: merchant_2.id)
    invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant_2.id)
    create(:invoice_item, invoice_id: invoice_2.id, item_id: item_2.id, quantity: 5, unit_price: 100)
    create(:transaction, invoice_id: invoice_2.id, result: "success")

    merchant_3 = create(:merchant, name: 'Bronze Merchant')
    item_3 = create(:item, merchant_id: merchant_3.id)
    invoice_3 = create(:invoice, customer_id: customer.id, merchant_id: merchant_3.id)
    create(:invoice_item, invoice_id: invoice_3.id, item_id: item_3.id, quantity: 1, unit_price: 100)
    create(:transaction, invoice_id: invoice_3.id, result: "success")

    merchant_4 = create(:merchant, name: 'Last Place Merchant')
    item_4 = create(:item, merchant_id: merchant_4.id)
    invoice_4 = create(:invoice, customer_id: customer.id, merchant_id: merchant_4.id)
    create(:invoice_item, invoice_id: invoice_4.id, item_id: item_4.id, quantity: 1, unit_price: 1)
    create(:transaction, invoice_id: invoice_4.id, result: "success")

    get "/api/v1/merchants/most_revenue?quantity=3"

    expect(response).to be_successful

    merchants_revenue_check = JSON.parse(response.body)
    expect(merchants_revenue_check).to_not eq({"data"=>nil})
    expect(merchants_revenue_check['data'].first['attributes']['id']).to eq(merchant_1.id)
    expect(merchants_revenue_check['data'].last['attributes']['id']).to eq(merchant_3.id)
  end

  it "returns the total revenue for date x across all merchants" do
    #total revenue for 2012-03-27 should be 1600

    merchant_1 = create(:merchant, name: 'Winner Merchant')
    item_1 = create(:item, merchant_id: merchant_1.id)
    customer = create(:customer)
    invoice_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant_1.id, created_at: '2012-03-27 14:58:15')
    create(:invoice_item, invoice_id: invoice_1.id, item_id: item_1.id, quantity: 10, unit_price: 100)
    create(:transaction, invoice_id: invoice_1.id, result: "success")

    merchant_2 = create(:merchant, name: 'Silver Merchant')
    item_2 = create(:item, merchant_id: merchant_2.id)
    invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant_2.id, created_at: '2012-03-27 14:58:15')
    create(:invoice_item, invoice_id: invoice_2.id, item_id: item_2.id, quantity: 5, unit_price: 100)
    create(:transaction, invoice_id: invoice_2.id, result: "success")

    merchant_3 = create(:merchant, name: 'Bronze Merchant')
    item_3 = create(:item, merchant_id: merchant_3.id)
    invoice_3 = create(:invoice, customer_id: customer.id, merchant_id: merchant_3.id, created_at: '2012-03-27 14:58:15')
    create(:invoice_item, invoice_id: invoice_3.id, item_id: item_3.id, quantity: 1, unit_price: 100)
    create(:transaction, invoice_id: invoice_3.id, result: "success")

    merchant_4 = create(:merchant, name: 'Last Place Merchant')
    item_4 = create(:item, merchant_id: merchant_4.id)
    invoice_4 = create(:invoice, customer_id: customer.id, merchant_id: merchant_4.id, created_at: '2015-04-12 13:33:33')
    create(:invoice_item, invoice_id: invoice_4.id, item_id: item_4.id, quantity: 1, unit_price: 1)
    create(:transaction, invoice_id: invoice_4.id, result: "success")

    get "/api/v1/merchants/revenue?date=2012-03-27"

    expect(response).to be_successful

    merchants_revenue_check = JSON.parse(response.body)
    expect(merchants_revenue_check).to_not eq({"data"=>nil})
    expect(merchants_revenue_check).to eq(1600.00)
  end
end