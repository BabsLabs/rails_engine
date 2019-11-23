class Api::V1::Customers::RandomController < ApplicationController

  def show
    rand_ids = Customer.pluck(:id).sample
    customer = Customer.find(rand_ids)
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end

end