require "rails_helper"

describe "Transactions API Relationship Endpoints" do
  it "returns the associated invoice" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    transaction = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_successful

    transaction_check = JSON.parse(response.body)
    expect(transaction_check).to_not eq({"data"=>nil})
    expect(transaction_check).to_not eq({"data"=>[]})
    expect(transaction_check['data']['type']).to eq('transaction_invoice')
    expect(transaction_check['data']['relationships']['invoice']['data']['id']).to eq(transaction.invoice_id.to_s)
    expect(transaction_check['data']['relationships']['invoice']['data']['type']).to eq('invoice')
  end
end