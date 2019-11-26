require 'rails_helper'

describe "Invoices API Random Endpoint" do
  it "can send a single random invoice" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 10, merchant_id: merchant.id, customer_id: customer.id)
    invoice_ids = Invoice.pluck(:id)

    get '/api/v1/invoices/random'

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data']['type']).to eq('invoice')
    expect(invoice_ids.include?(invoices_check['data']['attributes']['id'])).to be_truthy
  end
end