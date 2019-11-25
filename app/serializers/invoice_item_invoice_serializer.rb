class InvoiceItemInvoiceSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :item_id, :invoice_id, :quantity, :unit_price

  belongs_to :invoice
end