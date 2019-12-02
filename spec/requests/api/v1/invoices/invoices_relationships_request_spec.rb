require 'rails_helper'

describe "Invoices API Relationship Endpoints" do
  it "returns a collection of associated transactions" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 10, merchant_id: merchant.id, customer_id: customer.id)
    invoice = Invoice.first
    create_list(:transaction, 10, invoice_id: invoice.id)
    transactions = Transaction.count

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_successful

    invoice_transactions_check = JSON.parse(response.body)
    expect(invoice_transactions_check).to_not eq({"data"=>nil})
    expect(invoice_transactions_check['data'].count).to eq(transactions)
    expect(invoice_transactions_check['data'].first['type']).to eq('transaction')
  end

  it "returns a collection of associated invoice items" do
    merchant = create(:merchant)
    customer = create(:customer)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    create_list(:invoice_item, 10, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_successful

    invoice_invoice_items_check = JSON.parse(response.body)
    expect(invoice_invoice_items_check).to_not eq({"data"=>nil})
    expect(invoice_invoice_items_check['data'].count).to eq(InvoiceItem.count)
    expect(invoice_invoice_items_check['data'].first['type']).to eq('invoice_item')
  end

  it "returns a collection of associated items" do
    merchant = create(:merchant)
    customer = create(:customer)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    create_list(:invoice_item, 10, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_successful

    invoice_items_check = JSON.parse(response.body)
    expect(invoice_items_check).to_not eq({"data"=>nil})
    expect(invoice_items_check['data'].count).to eq(10)
    expect(invoice_items_check['data'].first['type']).to eq('item')
  end

  it "returns a the associated customer" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_successful

    invoice_customers_check = JSON.parse(response.body)
    expect(invoice_customers_check).to_not eq({"data"=>nil})
    expect(invoice_customers_check['data']['id']).to eq(customer.id.to_s)
    expect(invoice_customers_check['data']['type']).to eq('customer')
  end

  it "returns a the associated merchant" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_successful

    invoice_customers_check = JSON.parse(response.body)
    expect(invoice_customers_check).to_not eq({"data"=>nil})
    expect(invoice_customers_check['data']['id']).to eq(merchant.id.to_s)
    expect(invoice_customers_check['data']['type']).to eq('merchant')
  end
end