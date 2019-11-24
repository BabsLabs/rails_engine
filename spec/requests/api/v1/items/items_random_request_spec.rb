require "rails_helper"

describe "Items API Random Endpont" do
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