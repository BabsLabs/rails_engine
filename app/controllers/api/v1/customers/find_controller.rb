class Api::V1::Customers::FindController < ApplicationController

  def index
    customers = Customer.where("#{params.keys.first} = '#{params.values.first}'")
    serialized_customers = CustomerSerializer.new(customers)
    render json: serialized_customers
  end

  def show
    customer = Customer.find_by("#{params.keys.first} = '#{params.values.first}'")
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end

end