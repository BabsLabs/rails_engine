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

  it "send a single item" do
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

  it "can find a single item by id" do
    merchant_1 = create(:merchant)
    create_list(:item, 5, merchant_id: merchant_1.id)
    item_1 = Item.first
    item_2 = Item.last

    get "/api/v1/items/find?id=#{item_1.id}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data']['attributes']['id']).to eq(item_1.id)
    expect(items_check['data']['type']).to eq('item')
    expect(items_check['data']['attributes']['id']).to_not eq(item_2.id)
  end

  it "can find a single item by name" do
    merchant_1 = create(:merchant)
    create(:item, name: 'Box Of Goods', merchant_id: merchant_1.id)
    create(:item, name: 'Pizza Pants', merchant_id: merchant_1.id)
    item_1 = Item.first
    item_2 = Item.last

    get "/api/v1/items/find?name=#{item_1.name}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data']['attributes']['name']).to eq(item_1.name)
    expect(items_check['data']['type']).to eq('item')
    expect(items_check['data']['attributes']['name']).to_not eq(item_2.name)
  end

  it "can find a single item by description" do
    merchant_1 = create(:merchant)
    create(:item, description: 'A Big Box Of Goods', merchant_id: merchant_1.id)
    create(:item, description: 'A Pair Of Pristine Pizza Pants', merchant_id: merchant_1.id)
    item_1 = Item.first
    item_2 = Item.last

    get "/api/v1/items/find?description=#{item_1.description}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data']['attributes']['description']).to eq(item_1.description)
    expect(items_check['data']['type']).to eq('item')
    expect(items_check['data']['attributes']['description']).to_not eq(item_2.description)
  end

  it "can find a single item by unit_price" do
    merchant_1 = create(:merchant)
    create(:item, unit_price: 1.50, merchant_id: merchant_1.id)
    create(:item, unit_price: 2.00, merchant_id: merchant_1.id)
    item_1 = Item.first
    item_2 = Item.last

    get "/api/v1/items/find?unit_price=#{item_1.unit_price}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data']['attributes']['unit_price']).to eq(item_1.unit_price)
    expect(items_check['data']['type']).to eq('item')
    expect(items_check['data']['attributes']['unit_price']).to_not eq(item_2.unit_price)
  end

  it "can find a single item by created date" do
    merchant = create(:merchant)
    create_list(:item, 5, created_at: "2012-03-27T14:54:05.000Z", merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find?created_at=#{item.created_at}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data']['type']).to eq('item')
  end

  it "can find a single item by updated date" do
    merchant_1 = create(:merchant)
    create_list(:item, 5, updated_at: "2012-03-27T14:54:05.000Z", merchant_id: merchant_1.id)
    item = Item.last

    get "/api/v1/items/find?updated_at=#{item.updated_at}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data']['type']).to eq('item')
  end

  it "can find all items by id" do
    merchant_1 = create(:merchant)
    create_list(:item, 5, merchant_id: merchant_1.id)
    item_1 = Item.first

    get "/api/v1/items/find_all?id=#{item_1.id}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data'].first['type']).to eq('item')
    expect(items_check['data'].first['attributes']['id']).to eq(item_1.id)
  end

  it "can find all items by name" do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find_all?name=#{item.name}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data'].first['type']).to eq('item')
    expect(items_check['data'].first['attributes']['name']).to eq(item.name)
  end

  it "can find all items by description" do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find_all?description=#{item.description}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data'].first['type']).to eq('item')
    expect(items_check['data'].first['attributes']['description']).to eq(item.description)
  end

  it "can find all items by unit_price" do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find_all?unit_price=#{item.unit_price}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data'].first['type']).to eq('item')
    expect(items_check['data'].first['attributes']['unit_price']).to eq(item.unit_price)
  end

  it "can find all items by created_at" do
    merchant = create(:merchant)
    create_list(:item, 5, created_at: "2012-03-27T14:54:05.000Z", merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find_all?created_at=#{item.created_at}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data'].first['type']).to eq('item')
  end

  it "can find all items by updated_at" do
    merchant = create(:merchant)
    create_list(:item, 5, updated_at: "2012-03-27T14:54:05.000Z", merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find_all?updated_at=#{item.updated_at}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data'].first['type']).to eq('item')
  end

  it "can find a random item" do
    merchant = create(:merchant)
    create_list(:item, 5, updated_at: "2012-03-27T14:54:05.000Z", merchant_id: merchant.id)
    items_ids = Item.all.pluck(:id)

    get "/api/v1/items/random"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
    expect(items_check['data'].count).to eq(1)
    expect(items_check['data'].first['type']).to eq('item')
    expect(items_ids.include?(items_check['data'].first['attributes']['id'])).to be_truthy
  end
end