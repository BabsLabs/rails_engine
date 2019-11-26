require 'rails_helper'

describe "Transactions Api Find Endponts" do
  it "finds a transaction by id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 7, invoice_id: invoice.id)
    transaction = Transaction.first
    transaction_2 = Transaction.last

    get "/api/v1/transactions/find?id=#{transaction.id}"

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>nil})
    expect(transactions_check['data']['attributes']['id']).to eq(transaction.id)
    expect(transactions_check['data']['type']).to eq('transaction')
    expect(transactions_check['data']['attributes']['id']).to_not eq(transaction_2.id)
  end

  it "finds a transaction by invoice_id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    transaction = create(:transaction, invoice_id: invoice.id)
    transaction_2 = create(:transaction, invoice_id: invoice_2.id)

    get "/api/v1/transactions/find?invoice_id=#{transaction.invoice_id}"

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>nil})
    expect(transactions_check['data']['attributes']['invoice_id']).to eq(transaction.invoice_id)
    expect(transactions_check['data']['type']).to eq('transaction')
    expect(transactions_check['data']['attributes']['invoice_id']).to_not eq(transaction_2.invoice_id)
  end

  it "finds a transaction by credit_card_number" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    transaction = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/find?credit_card_number=#{transaction.credit_card_number}"

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>nil})
    expect(transactions_check['data']['attributes']['credit_card_number']).to eq(transaction.credit_card_number)
    expect(transactions_check['data']['type']).to eq('transaction')
  end

  it "finds a transaction by created_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    transaction = create(:transaction, invoice_id: invoice.id, created_at: '2012-03-27 14:58:15')

    get "/api/v1/transactions/find?created_at=#{transaction.created_at}"

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>nil})
    expect(transactions_check['data']['type']).to eq('transaction')
  end

  it "finds a transaction by updated_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    transaction = create(:transaction, invoice_id: invoice.id, updated_at: '2012-03-27 14:58:15')

    get "/api/v1/transactions/find?updated_at=#{transaction.updated_at}"

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>nil})
    expect(transactions_check['data']['type']).to eq('transaction')
  end

  it "finds all transactions by id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 7, invoice_id: invoice.id)
    transaction = Transaction.first

    get "/api/v1/transactions/find_all?id=#{transaction.id}"

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>nil})
    expect(transactions_check['data'].count).to eq(1)
    expect(transactions_check['data'].first['attributes']['id']).to eq(transaction.id)
    expect(transactions_check['data'].first['type']).to eq('transaction')
  end

  it "finds all transactions by invoice_id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 7, invoice_id: invoice.id)
    transaction = Transaction.first

    get "/api/v1/transactions/find_all?invoice_id=#{transaction.invoice_id}"

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>[]})
    expect(transactions_check['data'].count).to eq(7)
    expect(transactions_check['data'].first['attributes']['invoice_id']).to eq(transaction.invoice_id)
    expect(transactions_check['data'].first['type']).to eq('transaction')
  end

  it "finds all transactions by credit_card_number" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 7, invoice_id: invoice.id)
    transaction = Transaction.first

    get "/api/v1/transactions/find_all?credit_card_number=#{transaction.credit_card_number}"

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>[]})
    expect(transactions_check['data'].first['attributes']['credit_card_number']).to eq(transaction.credit_card_number)
    expect(transactions_check['data'].first['type']).to eq('transaction')
  end

  it "finds all transactions by result" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 7, invoice_id: invoice.id)
    transaction = Transaction.first

    get "/api/v1/transactions/find_all?result=#{transaction.result}"

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>[]})
    expect(transactions_check['data'].first['attributes']['result']).to eq(transaction.result)
    expect(transactions_check['data'].first['type']).to eq('transaction')
  end

  it "finds all transactions by created_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 7, invoice_id: invoice.id, created_at: '2012-03-27 14:58:15')
    transaction = Transaction.first

    get "/api/v1/transactions/find_all?created_at=#{transaction.created_at}"

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>[]})
    expect(transactions_check).to_not eq({"data"=>nil})
    expect(transactions_check['data'].first['type']).to eq('transaction')
  end

  it "finds all transactions by updated_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:transaction, 7, invoice_id: invoice.id, updated_at: '2012-03-27 14:58:15')
    transaction = Transaction.first

    get "/api/v1/transactions/find_all?updated_at=#{transaction.updated_at}"

    expect(response).to be_successful

    transactions_check = JSON.parse(response.body)
    expect(transactions_check).to_not eq({"data"=>[]})
    expect(transactions_check).to_not eq({"data"=>nil})
    expect(transactions_check['data'].first['type']).to eq('transaction')
  end
end