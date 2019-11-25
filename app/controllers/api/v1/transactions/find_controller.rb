class Api::V1::Transactions::FindController < ApplicationController

  def index
    transaction = Transaction.where("#{params.keys.first} = '#{params.values.first}'")
    serialzed_transaction = TransactionSerializer.new(transaction)
    render json: serialzed_transaction
  end

  def show
    transaction = Transaction.find_by("#{params.keys.first} = '#{params.values.first}'")
    serialzed_transaction = TransactionSerializer.new(transaction)
    render json: serialzed_transaction
  end

end