require 'rails_helper'

describe "Customers API Endponts" do
  it "sends a list of customers" do
    create_list(:customer, 10)
    customer_ids = Customer.all.pluck(:id)

    get '/api/v1/customers'

    expect(response).to be_successful

    customers_check = JSON.parse(response.body)
    expect(customers_check).to_not eq({"data"=>nil})
    expect(customers_check['data'].count).to eq(10)
    expect(customers_check['data'].first['type']).to eq('customer')
    expect(customer_ids.include?(customers_check['data'].first['attributes']['id'])).to be_truthy
  end

  it "sends a single customer" do
    customer = create(:customer)
    customer_2 = create(:customer)

    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data']['attributes']['id']).to eq(customer.id)
    expect(customer_check['data']['type']).to eq('customer')
    expect(customer_check['data']['attributes']['id']).to_not eq(customer_2.id)
  end

  it "sends a single customer" do
    customer = create(:customer)
    customer_2 = create(:customer)

    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data']['attributes']['id']).to eq(customer.id)
    expect(customer_check['data']['type']).to eq('customer')
    expect(customer_check['data']['attributes']['id']).to_not eq(customer_2.id)
  end

  it "finds a single customer by id" do
    customer = create(:customer)
    customer_2 = create(:customer)

    get "/api/v1/customers/find?id=#{customer.id}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data']['attributes']['id']).to eq(customer.id)
    expect(customer_check['data']['type']).to eq('customer')
    expect(customer_check['data']['attributes']['id']).to_not eq(customer_2.id)
  end

  it "finds a single customer by first_name" do
    customer = create(:customer, first_name: 'Joey', last_name: 'Joeyson')
    customer_2 = create(:customer, first_name: 'Patty', last_name: 'Petunia')

    get "/api/v1/customers/find?first_name=#{customer.first_name}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data']['attributes']['first_name']).to eq(customer.first_name)
    expect(customer_check['data']['type']).to eq('customer')
    expect(customer_check['data']['attributes']['first_name']).to_not eq(customer_2.first_name)
  end

  it "finds a single customer by last_name" do
    customer = create(:customer, first_name: 'Joey', last_name: 'Joeyson')
    customer_2 = create(:customer, first_name: 'Patty', last_name: 'Petunia')

    get "/api/v1/customers/find?last_name=#{customer.last_name}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data']['attributes']['last_name']).to eq(customer.last_name)
    expect(customer_check['data']['type']).to eq('customer')
    expect(customer_check['data']['attributes']['last_name']).to_not eq(customer_2.last_name)
  end

  it "finds all customers by id" do
    customer = create(:customer, first_name: 'Joey', last_name: 'Joeyson')
    customer_2 = create(:customer, first_name: 'Patty', last_name: 'Petunia')

    get "/api/v1/customers/find_all?id=#{customer.id}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data'].first['attributes']['id']).to eq(customer.id)
    expect(customer_check['data'].first['type']).to eq('customer')
    expect(customer_check['data'].first['attributes']['id']).to_not eq(customer_2.id)
  end

  it "finds all customers by first_name" do
    customer = create(:customer, first_name: 'Joey', last_name: 'Joeyson')
    customer_2 = create(:customer, first_name: 'Patty', last_name: 'Petunia')

    get "/api/v1/customers/find_all?first_name=#{customer.first_name}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data'].first['attributes']['first_name']).to eq(customer.first_name)
    expect(customer_check['data'].first['type']).to eq('customer')
    expect(customer_check['data'].first['attributes']['first_name']).to_not eq(customer_2.first_name)
  end

  it "finds all customers by last_name" do
    customer = create(:customer, first_name: 'Joey', last_name: 'Joeyson')
    customer_2 = create(:customer, first_name: 'Patty', last_name: 'Petunia')

    get "/api/v1/customers/find_all?last_name=#{customer.last_name}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data'].first['attributes']['last_name']).to eq(customer.last_name)
    expect(customer_check['data'].first['type']).to eq('customer')
    expect(customer_check['data'].first['attributes']['last_name']).to_not eq(customer_2.last_name)
  end

  it "finds a single random customer" do
    customers = create_list(:customer, 20)
    customer_ids = customers.pluck(:id)

    get "/api/v1/customers/random"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data']['type']).to eq('customer')
    expect(customer_ids.include?(customer_check['data']['attributes']['id'])).to be_truthy
  end

end