class ItemInvoiceItemSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :description, :unit_price

  has_many :invoice_items
end