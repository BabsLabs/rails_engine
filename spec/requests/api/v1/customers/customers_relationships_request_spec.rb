require 'rails_helper'

describe "Customer Relationship API Endpoints" do
  it "returns a collection of associated invoices" do
    customer = create(:customer)
    merchant = create(:merchant)
    create_list(:invoice, 10, customer_id: customer.id, merchant_id: merchant.id)

    get "/api/v1/customers/#{customer.id}/invoices"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data']['type']).to eq('customer_invoices')
    expect(customer_check['data']['relationships']['invoices']['data'].count).to eq(10)
  end

  it "returns a collection of assocsiated transactions" do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 25,invoice_id: invoice.id)

    get "/api/v1/customers/#{customer.id}/transactions"

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data']['type']).to eq('customer_transactions')
    expect(customer_check['data']['relationships']['transactions']['data'].count).to eq(25)
  end

end