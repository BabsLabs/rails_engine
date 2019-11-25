class InvoiceTransactionsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :customer_id, :merchant_id, :status

  has_many :transactions
end