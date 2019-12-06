class Api::V1::Items::FindController < ApplicationController

  def index
    items = Item.where(items_params).order(:id)
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end

  def show
    items = Item.where(items_params).first
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end

  private

  def items_params
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end

end