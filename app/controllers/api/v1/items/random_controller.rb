class Api::V1::Items::RandomController < ApplicationController

  def show
    random_id = Item.pluck(:id).sample(1)
    item = Item.find(random_id)
    serialized_item = ItemSerializer.new(item)
    render json: serialized_item
  end

end