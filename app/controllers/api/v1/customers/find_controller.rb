class Api::V1::Customers::FindController < ApplicationController

  def index
    customers = Customer.where(customers_params)
    serialized_customers = CustomerSerializer.new(customers)
    render json: serialized_customers
  end

  def show
    customer = Customer.find_by(customers_params)
    serialized_customer = CustomerSerializer.new(customer)
    render json: serialized_customer
  end

  private

  def customers_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end