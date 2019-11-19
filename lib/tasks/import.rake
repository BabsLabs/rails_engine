require 'csv'

desc "Import data from CSV file"
  task :import => [:environment] do

    merchant_file = "db/data/merchants.csv"

    CSV.foreach(merchant_file, :headers => true) do |row|
      Merchant.create!(
        :name => row[1]
      )
    end

    customer_file = "db/data/customers.csv"

    CSV.foreach(customer_file, :headers => true) do |row|
      Customer.create!(
        :first_name => row[1],
        :last_name => row[2]
      )
    end

    item_file = "db/data/items.csv"

    CSV.foreach(item_file, :headers => true) do |row|
      Item.create!(
        :name => row[1],
        :description => row[2],
        :unit_price => row[3].to_f / 100, #converts to dollars from cents
        :merchant_id => row[4]
      )
    end

    invoice_file = "db/data/invoices.csv"

    CSV.foreach(invoice_file, :headers => true) do |row|
      Invoice.create!(
        :customer_id => row[1],
        :merchant_id => row[2],
        :status => row[3]
      )
    end

    invoice_items_file = "db/data/invoice_items.csv"

    CSV.foreach(invoice_items_file, :headers => true) do |row|
      InvoiceItem.create!(
        :item_id => row[1],
        :invoice_id => row[2],
        :quantity => row[3],
        :unit_price => row[4].to_f / 100
      )
    end

    transaction_file = "db/data/transactions.csv"

    CSV.foreach(transaction_file, :headers => true) do |row|
      Transaction.create!(
        :invoice_id => row[1],
        :credit_card_number => row[2],
        :credit_card_expiration_date => row[3],
        :result => row[4]
      )
    end

end