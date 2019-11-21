class MerchantItemsSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id

  has_many :items
end