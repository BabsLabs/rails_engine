class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices

  def self.most_revenue(limit)
    joins(:invoice_items, :transactions).select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as total_revenue").group(:id).order("total_revenue desc").limit(limit)
  end
end