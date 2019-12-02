class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :item_id, :invoice_id, :quantity, :unit_price

  # convert unit price to string for spec harness
  attribute :unit_price do |invoice_item|
    invoice_item.unit_price.to_s
  end
end