class Api::V1::Merchants::RevenueController < ApplicationController

  def index
    revenue = Invoice.max_revenue_day(params.values.first)
    render json: revenue
  end

end