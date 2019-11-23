require 'rails_helper'

describe "Customers API Endponts" do
  it "sends a list of customers" do
    create_list(:customer, 10)

    get '/api/v1/customers'


    expect(response).to be_successful

    customers_check = JSON.parse(response.body)
    expect(customers_check).to_not eq({"data"=>nil})
    expect(customers_check['data'].count).to eq(10)
  end

  it "sends a single customer" do
    customer = create(:customer)
    customer_2 = create(:customer)

    get "/api/v1/customers/#{customer.id}"

    expect(response).to be_successful

    customer_check = JSON.parse(response.body)
    expect(customer_check).to_not eq({"data"=>nil})
    expect(customer_check['data']['attributes']['id']).to eq(customer.id)
    expect(customer_check['data']['attributes']['id']).to_not eq(customer_2.id)
  end
end