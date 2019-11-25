require 'rails_helper'

describe "Invoices API Relationship Endpoints" do
  it "returns a collection of associated transactions" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 10, merchant_id: merchant.id, customer_id: customer.id)
    invoice = Invoice.first
    create_list(:transaction, 10, invoice_id: invoice.id)
    transaction = Transaction.first

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_successful

    invoice_transactions_check = JSON.parse(response.body)
    expect(invoice_transactions_check).to_not eq({"data"=>nil})
    expect(invoice_transactions_check['data']['relationships']['transactions']['data'].count).to eq(Transaction.count)
    expect(invoice_transactions_check['data']['type']).to eq('invoice_transactions')
    expect(invoice_transactions_check['data']['relationships']['transactions']['data'].first['id']).to eq(transaction.id.to_s)
    expect(invoice_transactions_check['data']['relationships']['transactions']['data'].first['type']).to eq('transaction')
  end

  it "returns a collection of associated invoice items" do
    merchant = create(:merchant)
    customer = create(:customer)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    create_list(:invoice_item, 10, invoice_id: invoice.id, item_id: item.id)
    invoice_item = InvoiceItem.first

    get "/api/v1/invoices/#{invoice.id}/invoice_items"

    expect(response).to be_successful

    invoice_transactions_check = JSON.parse(response.body)
    expect(invoice_transactions_check).to_not eq({"data"=>nil})
    expect(invoice_transactions_check['data']['relationships']['invoice_items']['data'].count).to eq(InvoiceItem.count)
    expect(invoice_transactions_check['data']['type']).to eq('invoice_invoice_items')
    expect(invoice_transactions_check['data']['relationships']['invoice_items']['data'].first['id']).to eq(invoice_item.id.to_s)
    expect(invoice_transactions_check['data']['relationships']['invoice_items']['data'].first['type']).to eq('invoice_item')
  end

  it "returns a collection of associated items" do
    merchant = create(:merchant)
    customer = create(:customer)
    item = create(:item, merchant_id: merchant.id)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    create_list(:invoice_item, 10, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoices/#{invoice.id}/items"

    expect(response).to be_successful

    invoice_transactions_check = JSON.parse(response.body)
    expect(invoice_transactions_check).to_not eq({"data"=>nil})
    expect(invoice_transactions_check['data']['relationships']['items']['data'].count).to eq(10)
    expect(invoice_transactions_check['data']['type']).to eq('invoice_items')
    expect(invoice_transactions_check['data']['relationships']['items']['data'].first['id']).to eq(item.id.to_s)
    expect(invoice_transactions_check['data']['relationships']['items']['data'].first['type']).to eq('item')
  end
end