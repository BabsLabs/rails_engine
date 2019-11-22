require 'rails_helper'

describe "Merchants Business Intelligence" do
  it "returns the top x merchants ranked by total revenue" do
    merchant_1 = create(:merchant, name: 'Winner Merchant')
    item_1 = create(:item, merchant_id: merchant_1.id)
    customer = create(:customer)
    invoice_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant_1.id)
    invoice_item_1 = create(:invoice_item, invoice_id: invoice_1.id, item_id: item_1.id, quantity: 10, unit_price: 100)
    transaction_1 = create(:transaction, invoice_id: invoice_1.id, result: "success")

    merchant_2 = create(:merchant, name: 'Silver Merchant')
    item_2 = create(:item, merchant_id: merchant_2.id)
    invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant_2.id)
    invoice_item_2 = create(:invoice_item, invoice_id: invoice_2.id, item_id: item_2.id, quantity: 5, unit_price: 100)
    transaction_2 = create(:transaction, invoice_id: invoice_2.id, result: "success")

    merchant_3 = create(:merchant, name: 'Bronze Merchant')
    item_3 = create(:item, merchant_id: merchant_3.id)
    invoice_3 = create(:invoice, customer_id: customer.id, merchant_id: merchant_3.id)
    invoice_item_3 = create(:invoice_item, invoice_id: invoice_3.id, item_id: item_3.id, quantity: 1, unit_price: 100)
    transaction_3 = create(:transaction, invoice_id: invoice_3.id, result: "success")

    merchant_4 = create(:merchant, name: 'Last Place Merchant')
    item_4 = create(:item, merchant_id: merchant_4.id)
    invoice_4 = create(:invoice, customer_id: customer.id, merchant_id: merchant_4.id)
    invoice_item_4 = create(:invoice_item, invoice_id: invoice_4.id, item_id: item_4.id, quantity: 1, unit_price: 1)
    transaction_4 = create(:transaction, invoice_id: invoice_4.id, result: "success")

    get "/api/v1/merchants/most_revenue?quantity=3"

    expect(response).to be_successful

    merchants_revenue_check = JSON.parse(response.body)
    expect(merchants_revenue_check).to_not eq({"data"=>nil})
  end

end