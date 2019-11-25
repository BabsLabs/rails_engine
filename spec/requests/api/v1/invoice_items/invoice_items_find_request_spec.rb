require 'rails_helper'

describe "Invoice_items API Find Endpoints" do
  it "can find a single invoice_item by id" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice.id, quantity: 5, unit_price: 1.00)

    get "/api/v1/invoice_items/find?id=#{invoice_item_1.id}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data']['type']).to eq('invoice_item')
    expect(invoice_item_check['data']['attributes']['id']).to eq(invoice_item_1.id)
    expect(invoice_item_check['data']['attributes']['id']).to_not eq(invoice_item_2.id)
  end

  it "can find a single invoice_item by item_id" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice.id, quantity: 5, unit_price: 1.00)

    get "/api/v1/invoice_items/find?item_id=#{invoice_item_1.item_id}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data']['type']).to eq('invoice_item')
    expect(invoice_item_check['data']['attributes']['item_id']).to eq(invoice_item_1.item_id)
    expect(invoice_item_check['data']['attributes']['item_id']).to_not eq(invoice_item_2.item_id)
  end

  it "can find a single invoice_item by invoice_id" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id, quantity: 5, unit_price: 1.00)

    get "/api/v1/invoice_items/find?invoice_id=#{invoice_item_1.invoice_id}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data']['type']).to eq('invoice_item')
    expect(invoice_item_check['data']['attributes']['invoice_id']).to eq(invoice_item_1.invoice_id)
    expect(invoice_item_check['data']['attributes']['invoice_id']).to_not eq(invoice_item_2.invoice_id)
  end

  it "can find a single invoice_item by quantity" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice.id, quantity: 5, unit_price: 1.00)

    get "/api/v1/invoice_items/find?quantity=#{invoice_item_1.quantity}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data']['type']).to eq('invoice_item')
    expect(invoice_item_check['data']['attributes']['quantity']).to eq(invoice_item_1.quantity)
    expect(invoice_item_check['data']['attributes']['quantity']).to_not eq(invoice_item_2.quantity)
  end

  it "can find a single invoice_item by unit_price" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice.id, quantity: 5, unit_price: 1.00)

    get "/api/v1/invoice_items/find?unit_price=#{invoice_item_1.unit_price}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data']['type']).to eq('invoice_item')
    expect(invoice_item_check['data']['attributes']['unit_price']).to eq(invoice_item_1.unit_price)
    expect(invoice_item_check['data']['attributes']['unit_price']).to_not eq(invoice_item_2.unit_price)
  end

  it "can find a single invoice_item by created_at" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50, created_at: '2012-03-27 14:54:09')

    get "/api/v1/invoice_items/find?created_at=#{invoice_item_1.created_at}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data']['type']).to eq('invoice_item')
  end

  it "can find a single invoice_item by updated_at" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50, updated_at: '2012-03-27 14:54:09')

    get "/api/v1/invoice_items/find?updated_at=#{invoice_item_1.updated_at}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data']['type']).to eq('invoice_item')
  end

  it "can find all invoice_items by id" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice.id, quantity: 5, unit_price: 1.00)

    get "/api/v1/invoice_items/find_all?id=#{invoice_item_1.id}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data'].first['type']).to eq('invoice_item')
    expect(invoice_item_check['data'].first['attributes']['id']).to eq(invoice_item_1.id)
    expect(invoice_item_check['data'].first['attributes']['id']).to_not eq(invoice_item_2.id)
  end

  it "can find all invoice_items by item_id" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice.id, quantity: 5, unit_price: 1.00)
    invoice_item_3 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)

    get "/api/v1/invoice_items/find_all?item_id=#{invoice_item_1.item_id}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data'].first['type']).to eq('invoice_item')
    expect(invoice_item_check['data'].first['attributes']['item_id']).to eq(invoice_item_1.item_id)
    expect(invoice_item_check['data'].first['attributes']['item_id']).to_not eq(invoice_item_2.item_id)
    expect(invoice_item_check['data'].last['attributes']['item_id']).to eq(invoice_item_3.item_id)
  end

  it "can find all invoice_items by invoice_id" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice_2.id, quantity: 5, unit_price: 1.00)
    invoice_item_3 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)

    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice_item_1.invoice_id}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data'].first['type']).to eq('invoice_item')
    expect(invoice_item_check['data'].first['attributes']['invoice_id']).to eq(invoice_item_1.invoice_id)
    expect(invoice_item_check['data'].first['attributes']['invoice_id']).to_not eq(invoice_item_2.invoice_id)
    expect(invoice_item_check['data'].last['attributes']['invoice_id']).to eq(invoice_item_3.invoice_id)
  end

  it "can find all invoice_items by quantity" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 5, unit_price: 1.00)
    invoice_item_3 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)

    get "/api/v1/invoice_items/find_all?quantity=#{invoice_item_1.quantity}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data'].first['type']).to eq('invoice_item')
    expect(invoice_item_check['data'].first['attributes']['quantity']).to eq(invoice_item_1.quantity)
    expect(invoice_item_check['data'].first['attributes']['quantity']).to_not eq(invoice_item_2.quantity)
    expect(invoice_item_check['data'].last['attributes']['quantity']).to eq(invoice_item_3.quantity)
  end

  it "can find all invoice_items by unit_price" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_2 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 5, unit_price: 1.00)
    invoice_item_3 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)

    get "/api/v1/invoice_items/find_all?unit_price=#{invoice_item_1.unit_price}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data'].first['type']).to eq('invoice_item')
    expect(invoice_item_check['data'].first['attributes']['unit_price']).to eq(invoice_item_1.unit_price)
    expect(invoice_item_check['data'].first['attributes']['unit_price']).to_not eq(invoice_item_2.unit_price)
    expect(invoice_item_check['data'].last['attributes']['unit_price']).to eq(invoice_item_3.unit_price)
  end

  it "can find all invoice_items by created_at" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50, created_at: '2012-03-27 14:54:09')

    get "/api/v1/invoice_items/find_all?created_at=#{invoice_item_1.created_at}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data'].first['type']).to eq('invoice_item')
  end

  it "can find all invoice_items by updated_at" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_item_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50, updated_at: '2012-03-27 14:54:09')

    get "/api/v1/invoice_items/find_all?updated_at=#{invoice_item_1.updated_at}"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data'].first['type']).to eq('invoice_item')
  end
end