class Api::V1::Customers::InvoicesController < ApplicationController

  def index
    customer = Customer.find(params[:id])
    serialized_customer = InvoiceSerializer.new(customer.invoices)
    render json: serialized_customer
  end

end