class MerchantInvoicesSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id

  has_many :invoices
end