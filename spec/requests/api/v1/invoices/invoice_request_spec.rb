require 'rails_helper'

describe "Invoices API Endpoints" do
  it "can send a list of invoices" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 10, merchant_id: merchant.id, customer_id: customer.id)

    get '/api/v1/invoices'

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data'].count).to eq(10)
    expect(invoices_check['data'].first['type']).to eq('invoice')
  end

end