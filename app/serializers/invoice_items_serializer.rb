class InvoiceItemsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :customer_id, :merchant_id, :status

  has_many :items
end