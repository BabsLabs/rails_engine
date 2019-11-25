require 'rails_helper'

describe "Transactions Api Endponts" do
  it "sends a list of transactions" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 7, invoice_id: invoice.id)
    transactions_ids = Transaction.pluck(:id)

    get '/api/v1/transactions'

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>nil})
    expect(transactions_check['data'].count).to eq(7)
    expect(transactions_check['data'].first['type']).to eq('transaction')
    expect(transactions_check['data'].first['attributes']['id']).to eq(Transaction.first.id)
    expect(transactions_ids.include?(transactions_check['data'].first['attributes']['id'])).to be_truthy
  end

  it "sends a single transaction" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 7, invoice_id: invoice.id)
    transaction = Transaction.first
    transaction_2 = Transaction.last

    get "/api/v1/transactions/#{transaction.id}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data']['attributes']['id']).to eq(transaction.id)
    expect(items_check['data']['type']).to eq('transaction')
    expect(items_check['data']['attributes']['id']).to_not eq(transaction_2.id)
  end
end