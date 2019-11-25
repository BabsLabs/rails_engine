class InvoiceCustomerSerializer
  include FastJsonapi::ObjectSerializer

    attributes :id, :customer_id, :merchant_id, :status

    belongs_to :customer
end