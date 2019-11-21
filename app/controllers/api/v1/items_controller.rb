class Api::V1::ItemsController < ApplicationController

  def index
    items = Item.all
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end

  def show
    item = Item.find(params[:id])
    serialized_item = ItemSerializer.new(item)
    render json: serialized_item
  end

  def find
    items = Item.find_by("#{params.keys.first} = '#{params.values.first}'")
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end

  def find_all
    items = Item.where("#{params.keys.first} = '#{params.values.first}'")
    serialized_items = ItemSerializer.new(items)
    render json: serialized_items
  end

  def random
    random_id = Item.pluck(:id).sample(1)
    item = Item.find(random_id)
    serialized_item = ItemSerializer.new(item)
    render json: serialized_item
  end

end