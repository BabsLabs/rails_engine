require 'rails_helper'

describe "Transactions API Random Endpoint" do
  it "sends a single random transaction" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 7, invoice_id: invoice.id)
    transaction_ids = Transaction.pluck(:id)

    get "/api/v1/transactions/random"

    expect(response).to be_successful

    transaction_check = JSON.parse(response.body)
    expect(transaction_check).to_not eq({"data"=>nil})
    expect(transaction_check).to_not eq({"data"=>[]})
    expect(transaction_check['data']['type']).to eq('transaction')
    expect(transaction_ids.include?(transaction_check['data']['attributes']['id'])).to be_truthy
  end
end