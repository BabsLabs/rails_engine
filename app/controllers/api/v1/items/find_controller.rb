class Api::V1::Items::FindController < ApplicationController

  def index
    items = Item.where("#{params.keys.first} = '#{params.values.first}'").order(:id)
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end

  def show
    items = Item.where("#{params.keys.first} = '#{params.values.first}'").first
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end

end