class Api::V1::Customers::TransactionsController < ApplicationController

  def index
    customer = Customer.find(params[:id])
    serialized_customer = CustomerTransactionsSerializer.new(customer)
    render json: serialized_customer
  end

end