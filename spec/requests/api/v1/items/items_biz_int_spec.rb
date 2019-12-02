# Business Intelligence Tests Relating To Items
require 'rails_helper'

describe "Items Business Intelligence" do
  it "returns the top x items ranked by total revenue generated" do
    skip
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

    get "/api/v1/items/most_revenue?quantity=3"

    expect(response).to be_successful

    items_revenue_check = JSON.parse(response.body)
    expect(items_revenue_check).to_not eq({"data"=>nil})
    expect(items_revenue_check['data'].first['attributes']['id']).to eq(item_1.id)
    expect(items_revenue_check['data'].last['attributes']['id']).to eq(item_3.id)
  end

  it "returns the date with the most sales for the given item using the invoice date" do
    skip
    merchant_1 = create(:merchant, name: 'Winner Merchant')
    item_1 = create(:item, merchant_id: merchant_1.id)
    customer = create(:customer)
    invoice_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant_1.id, created_at: '2012-03-27 14:58:15')
    create(:invoice_item, invoice_id: invoice_1.id, item_id: item_1.id, quantity: 10, unit_price: 100)
    create(:transaction, invoice_id: invoice_1.id, result: "success")

    merchant_2 = create(:merchant, name: 'Silver Merchant')
    item_2 = create(:item, merchant_id: merchant_2.id)
    invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant_2.id, created_at: '2012-03-26 14:58:15')
    create(:invoice_item, invoice_id: invoice_2.id, item_id: item_2.id, quantity: 10, unit_price: 100)
    create(:transaction, invoice_id: invoice_2.id, result: "success")

    merchant_3 = create(:merchant, name: 'Bronze Merchant')
    item_3 = create(:item, merchant_id: merchant_3.id)
    invoice_3 = create(:invoice, customer_id: customer.id, merchant_id: merchant_3.id)
    create(:invoice_item, invoice_id: invoice_3.id, item_id: item_3.id, quantity: 1, unit_price: 100, created_at: '2012-03-25 14:58:15')
    create(:transaction, invoice_id: invoice_3.id, result: "success")

    merchant_4 = create(:merchant, name: 'Last Place Merchant')
    item_4 = create(:item, merchant_id: merchant_4.id)
    invoice_4 = create(:invoice, customer_id: customer.id, merchant_id: merchant_4.id)
    create(:invoice_item, invoice_id: invoice_4.id, item_id: item_4.id, quantity: 1, unit_price: 1, created_at: '2012-03-24 14:58:15')
    create(:transaction, invoice_id: invoice_4.id, result: "success")

    get "/api/v1/items/#{item_1.id}/best_day?date=2012-03-27"

    expect(response).to be_successful

    items_revenue_check = JSON.parse(response.body)
  end
end