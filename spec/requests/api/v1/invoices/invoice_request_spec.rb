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
    expect(invoices_check['data']['id']).to_not eq(invoice_2.id.to_s)
  end

  it "can find a single invoice by id" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 10, merchant_id: merchant.id, customer_id: customer.id)
    invoice_1 = Invoice.first
    invoice_2 = Invoice.last

    get "/api/v1/invoices/find?id=#{invoice_1.id}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data']['type']).to eq('invoice')
    expect(invoices_check['data']['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data']['id']).to_not eq(invoice_2.id.to_s)
  end

  it "can find a single invoice by customer_id" do
    merchant = create(:merchant)
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant_id: merchant.id, customer_id: customer_1.id)
    invoice_2 = create(:invoice, merchant_id: merchant.id, customer_id: customer_2.id)

    get "/api/v1/invoices/find?customer_id=#{invoice_1.customer_id}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data']['type']).to eq('invoice')
    expect(invoices_check['data']['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data']['attributes']['customer_id']).to eq(invoice_1.customer_id)
    expect(invoices_check['data']['attributes']['customer_id']).to_not eq(invoice_2.customer_id)
  end

  it "can find a single invoice by merchant_id" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant_id: merchant_1.id, customer_id: customer.id)
    invoice_2 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer.id)

    get "/api/v1/invoices/find?merchant_id=#{invoice_1.merchant_id}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data']['type']).to eq('invoice')
    expect(invoices_check['data']['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data']['attributes']['merchant_id']).to eq(invoice_1.merchant_id)
    expect(invoices_check['data']['attributes']['merchant_id']).to_not eq(invoice_2.merchant_id)
  end

  it "can find a single invoice by status" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id, status: 'shipped')
    invoice_2 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id, status: 'pending')

    get "/api/v1/invoices/find?status=#{invoice_1.status}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data']['type']).to eq('invoice')
    expect(invoices_check['data']['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data']['attributes']['status']).to eq(invoice_1.status)
    expect(invoices_check['data']['attributes']['status']).to_not eq(invoice_2.status)
  end

  it "can find a single invoice by created_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id, created_at: '2012-03-17 19:54:15')
    invoice_2 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id, created_at: '2013-12-09 06:35:24')

    get "/api/v1/invoices/find?created_at=#{invoice_1.created_at}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data']['type']).to eq('invoice')
    expect(invoices_check['data']['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data'].values).not_to include(invoice_2.created_at)
  end

  it "can find a single invoice by updated_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id, updated_at: '2012-03-17 19:54:15')
    invoice_2 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id, updated_at: '2013-12-09 06:35:24')

    get "/api/v1/invoices/find?updated_at=#{invoice_1.updated_at}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data']['type']).to eq('invoice')
    expect(invoices_check['data']['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data'].values).not_to include(invoice_2.updated_at)
  end

  it "can find all invoices by id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    invoice_2 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)

    get "/api/v1/invoices/find_all?id=#{invoice_1.id}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data'].first['type']).to eq('invoice')
    expect(invoices_check['data'].first['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data'].first['attributes']['id']).to eq(invoice_1.id)
    expect(invoices_check['data'].first['attributes']['id']).to_not eq(invoice_2.id)
  end

  it "can find all invoices by customer_id" do
    merchant = create(:merchant)
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    create_list(:invoice, 5, merchant_id: merchant.id, customer_id: customer_1.id)
    invoice_1 = Invoice.first
    invoice_6 = create(:invoice, merchant_id: merchant.id, customer_id: customer_2.id)

    get "/api/v1/invoices/find_all?customer_id=#{invoice_1.customer_id}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data'].first['type']).to eq('invoice')
    expect(invoices_check['data'].first['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data'].first['attributes']['customer_id']).to eq(invoice_1.customer_id)
    expect(invoices_check['data'].last['attributes']['customer_id']).to_not eq(invoice_6.customer_id)
  end

  it "can find all invoices by merchant_id" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 5, merchant_id: merchant_1.id, customer_id: customer.id)
    invoice_1 = Invoice.first
    invoice_6 = create(:invoice, merchant_id: merchant_2.id, customer_id: customer.id)

    get "/api/v1/invoices/find_all?merchant_id=#{invoice_1.merchant_id}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data'].first['type']).to eq('invoice')
    expect(invoices_check['data'].first['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data'].first['attributes']['merchant_id']).to eq(invoice_1.merchant_id)
    expect(invoices_check['data'].last['attributes']['merchant_id']).to_not eq(invoice_6.merchant_id)
  end

  it "can find all invoices by status" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 5, merchant_id: merchant.id, customer_id: customer.id, status: 'shipped')
    invoice_1 = Invoice.first
    invoice_6 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id, status: 'pending')

    get "/api/v1/invoices/find_all?status=#{invoice_1.status}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data'].first['type']).to eq('invoice')
    expect(invoices_check['data'].first['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data'].first['attributes']['status']).to eq(invoice_1.status)
    expect(invoices_check['data'].last['attributes']['status']).to_not eq(invoice_6.status)
  end

  it "can find all invoices by created_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 5, merchant_id: merchant.id, customer_id: customer.id, created_at: '2012-03-17 19:54:15')
    invoice_1 = Invoice.first
    invoice_2 = Invoice.last

    get "/api/v1/invoices/find_all?status=#{invoice_1.status}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data'].first['type']).to eq('invoice')
    expect(invoices_check['data'].first['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data'].last['id']).to eq(invoice_2.id.to_s)
  end

  it "can find all invoices by updated_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    create_list(:invoice, 5, merchant_id: merchant.id, customer_id: customer.id, updated_at: '2012-03-17 19:54:15')
    invoice_1 = Invoice.first
    invoice_2 = Invoice.last

    get "/api/v1/invoices/find_all?status=#{invoice_1.status}"

    expect(response).to be_successful

    invoices_check = JSON.parse(response.body)
    expect(invoices_check).to_not eq({"data"=>nil})
    expect(invoices_check['data'].first['type']).to eq('invoice')
    expect(invoices_check['data'].first['id']).to eq(invoice_1.id.to_s)
    expect(invoices_check['data'].last['id']).to eq(invoice_2.id.to_s)
  end

end