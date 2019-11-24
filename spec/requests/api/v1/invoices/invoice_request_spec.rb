require 'rails_helper'

describe "Invoices API Endpoints" do
  it "can send a list of invoices" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 10, merchant_id: merchant.id, customer_id: customer.id)
    invoice = Invoice.first

    get '/api/v1/invoices'

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data'].count).to eq(10)
    expect(invoices_check['data'].first['type']).to eq('invoice')
    expect(invoices_check['data'].first['id']).to eq(invoice.id.to_s)
  end

  it "can send a single invoices" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 10, merchant_id: merchant.id, customer_id: customer.id)
    invoice_1 = Invoice.first
    invoice_2 = Invoice.last

    get "/api/v1/invoices/#{invoice_1.id}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data']['type']).to eq('invoice')
    expect(invoices_check['data']['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data'].values).not_to include(invoice_2.id.to_s)
  end

end