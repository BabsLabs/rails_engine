require 'rails_helper'

describe "Items Api Endponts" do
  it "sends a list of items" do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)

    get '/api/v1/items'

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "send a single item" do
    merchant_1 = create(:merchant)
    create_list(:item, 5, merchant_id: merchant_1.id)
    item_1 = Item.last

    get "/api/v1/items/#{item_1.id}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find a single item by id" do
    merchant_1 = create(:merchant)
    create_list(:item, 5, merchant_id: merchant_1.id)
    item = Item.last

    get "/api/v1/items/find?id=#{item.id}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find a single item by name" do
    merchant_1 = create(:merchant)
    create_list(:item, 5, merchant_id: merchant_1.id)
    item = Item.last

    get "/api/v1/items/find?name=#{item.name}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find a single item by description" do
    merchant_1 = create(:merchant)
    create_list(:item, 5, merchant_id: merchant_1.id)
    item = Item.last

    get "/api/v1/items/find?description=#{item.description}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find a single item by unit_price" do
    merchant_1 = create(:merchant)
    create_list(:item, 5, merchant_id: merchant_1.id)
    item = Item.last

    get "/api/v1/items/find?unit_price=#{item.unit_price}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find a single item by created date" do
    merchant = create(:merchant)
    create_list(:item, 5, created_at: "2012-03-27T14:54:05.000Z", merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find?created_at=#{item.created_at}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find a single item by updated date" do
    merchant_1 = create(:merchant)
    create_list(:item, 5, updated_at: "2012-03-27T14:54:05.000Z", merchant_id: merchant_1.id)
    item = Item.last

    get "/api/v1/items/find?updated_at=#{item.updated_at}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find all items by id" do
    merchant_1 = create(:merchant)
    create_list(:item, 5, merchant_id: merchant_1.id)
    item = Item.last

    get "/api/v1/items/find_all?id=#{item.id}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find all items by name" do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find_all?name=#{item.name}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find all items by description" do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find_all?description=#{item.description}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find all items by unit_price" do
    merchant = create(:merchant)
    create_list(:item, 5, merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find_all?unit_price=#{item.unit_price}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find all items by created_at" do
    merchant = create(:merchant)
    create_list(:item, 5, created_at: "2012-03-27T14:54:05.000Z", merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find_all?created_at=#{item.created_at}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find all items by updated_at" do
    merchant = create(:merchant)
    create_list(:item, 5, updated_at: "2012-03-27T14:54:05.000Z", merchant_id: merchant.id)
    item = Item.last

    get "/api/v1/items/find_all?updated_at=#{item.updated_at}"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end

  it "can find a random item" do
    merchant = create(:merchant)
    create_list(:item, 5, updated_at: "2012-03-27T14:54:05.000Z", merchant_id: merchant.id)

    get "/api/v1/items/random"

    expect(response).to be_successful

    items_check = JSON.parse(response.body)
    expect(items_check).to_not eq({"data"=>nil})
  end
end