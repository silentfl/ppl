class TransactionFix < ActiveRecord::Migration[5.1]
  def change
    remove_reference :transactions, :user
    add_reference :transactions, :deposit, index: true
  end
end
