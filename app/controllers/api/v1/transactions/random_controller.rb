class Api::V1::Transactions::RandomController < ApplicationController

  def show
    random_id = Transaction.pluck(:id).sample
    transaction = Transaction.find(random_id)
    serialized_transaction = TransactionSerializer.new(transaction)
    render json: serialized_transaction
  end

end