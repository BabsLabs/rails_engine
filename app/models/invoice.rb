class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.max_revenue_day(date)
    joins(:invoice_items, :transactions).where(transactions: {result: :success}).where(created_at: date.to_date.all_day ).sum('quantity * unit_price')
  end

end