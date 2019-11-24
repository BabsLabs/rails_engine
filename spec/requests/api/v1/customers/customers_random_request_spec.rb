require 'rails_helper'

describe "Items API Random Endpoint" do
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