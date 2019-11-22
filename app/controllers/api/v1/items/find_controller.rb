class Api::V1::Items::FindController < ApplicationController

  def index
    items = Item.where("#{params.keys.first} = '#{params.values.first}'")
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end

  def show
    items = Item.find_by("#{params.keys.first} = '#{params.values.first}'")
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end

end