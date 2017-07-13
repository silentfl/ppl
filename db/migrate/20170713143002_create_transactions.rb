class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :user
      t.references :gateway
      t.monetize :amount
      t.integer :status, default: 0
      t.string :comment

      t.timestamps
    end
  end
end
