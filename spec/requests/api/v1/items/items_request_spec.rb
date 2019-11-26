require 'rails_helper'

describe "Items Api Endponts" do
  it "sends a list of items" do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    items_ids = Item.all.pluck(:id)

    get '/api/v1/items'

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data'].count).to eq(5)
    expect(items_check['data'].first['type']).to eq('item')
    expect(items_ids.include?(items_check['data'].first['attributes']['id'])).to be_truthy
  end

  it "sends a single item" do
    merchant_1 = create(:merchant)
    create_list(:item, 5, merchant_id: merchant_1.id)
    item_1 = Item.first
    item_2 = Item.last

    get "/api/v1/items/#{item_1.id}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data']['attributes']['id']).to eq(item_1.id)
    expect(items_check['data']['type']).to eq('item')
    expect(items_check['data']['attributes']['id']).to_not eq(item_2.id)
  end
end