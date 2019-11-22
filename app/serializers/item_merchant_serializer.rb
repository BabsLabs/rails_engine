class ItemMerchantSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :description, :unit_price

  belongs_to :merchant
end