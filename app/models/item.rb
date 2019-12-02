class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.most_revenue(limit)
    joins(:invoice_items, :transactions).select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) as total_revenue").group(:id).order("total_revenue desc").limit(limit)
  end
end
