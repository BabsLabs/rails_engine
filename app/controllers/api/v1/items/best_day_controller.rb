class Api::V1::Items::BestDayController < ApplicationController

  def index
    best_day_invoice = InvoiceItems.best_day(params.values.first)
    serialzed_invoice = InvoiceSerializer.new(best_day_invoice)
    render json: serialzed_invoice
  end

end