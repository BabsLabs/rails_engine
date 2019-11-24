class Api::V1::Customers::InvoicesController < ApplicationController

  def index
    customer = Customer.find(params[:id])
    serialized_customer = CustomerInvoicesSerializer.new(customer)
    render json: serialized_customer
  end

end