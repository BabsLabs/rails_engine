require "rails_helper"

describe "Invoice_items API Random Endpoint" do
  it "can send a random invoice_item" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    create_list(:invoice_item, 10, item_id: item.id, invoice_id: invoice.id, quantity: 10, unit_price: 2.50)
    invoice_item_ids = InvoiceItem.pluck(:id)

    get "/api/v1/invoice_items/random"

    expect(response).to be_successful

    invoice_item_check = JSON.parse(response.body)
    expect(invoice_item_check).to_not eq({"data"=>nil})
    expect(invoice_item_check['data']['type']).to eq('invoice_item')
    expect(invoice_item_ids.include?(invoice_item_check['data']['attributes']['id'])).to be_truthy
  end
end