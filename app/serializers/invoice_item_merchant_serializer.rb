class InvoiceItemMerchantSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :item_id, :invoice_id, :quantity, :unit_price

  has_many :merchants
end