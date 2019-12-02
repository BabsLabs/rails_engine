class Api::V1::Items::MostRevenueController < ApplicationController

  def index
    top_items = Item.most_revenue(params.values.first)
    serialized_top_items = ItemSerializer.new(top_items)
    render json: serialized_top_items
  end

end