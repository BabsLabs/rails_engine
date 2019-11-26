require "rails_helper"

describe "Items API Find Endpoints" do
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

  it "finds a single customer by created_at" do
    customer = create(:customer, first_name: 'Joey', last_name: 'Joeyson', created_at: '2012-03-17 19:54:15')
    customer_2 = create(:customer, first_name: 'Patty', last_name: 'Petunia', created_at: '2014-10-30 12:12:12')

    get "/api/v1/customers/find?created_at=#{customer.created_at}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data']['attributes']['id']).to eq(customer.id)
    expect(customer_check['data']['type']).to eq('customer')
    expect(customer_check['data']['attributes']['id']).to_not eq(customer_2.id)
  end

  it "finds a single customer by updated_at" do
    customer = create(:customer, first_name: 'Joey', last_name: 'Joeyson', updated_at: '2012-03-17 19:54:15')
    customer_2 = create(:customer, first_name: 'Patty', last_name: 'Petunia', updated_at: '2014-10-30 12:12:12')

    get "/api/v1/customers/find?updated_at=#{customer.updated_at}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data']['attributes']['id']).to eq(customer.id)
    expect(customer_check['data']['type']).to eq('customer')
    expect(customer_check['data']['attributes']['id']).to_not eq(customer_2.id)
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

  it "finds all customers by created_at" do
    create_list(:customer, 10, created_at: '2012-03-17 19:54:15')
    customer_1 = Customer.first
    customer_2 = create(:customer, created_at: '2014-10-30 12:12:12')

    get "/api/v1/customers/find_all?created_at=#{customer_1.created_at}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data'].count).to eq(10)
    expect(customer_check['data'].first['attributes']['id']).to eq(customer_1.id)
    expect(customer_check['data'].first['type']).to eq('customer')
    expect(customer_check['data'].last['attributes']['id']).to_not eq(customer_2.id)
  end

  it "finds all customers by updated_at" do
    create_list(:customer, 10, updated_at: '2012-03-17 19:54:15')
    customer_1 = Customer.first
    customer_2 = create(:customer, updated_at: '2014-10-30 12:12:12')

    get "/api/v1/customers/find_all?updated_at=#{customer_1.updated_at}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data'].count).to eq(10)
    expect(customer_check['data'].first['attributes']['id']).to eq(customer_1.id)
    expect(customer_check['data'].first['type']).to eq('customer')
    expect(customer_check['data'].last['attributes']['id']).to_not eq(customer_2.id)
  end
end