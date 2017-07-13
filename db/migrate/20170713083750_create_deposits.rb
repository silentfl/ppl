class CreateDeposits < ActiveRecord::Migration[5.1]
  def change
    create_table :deposits, id: :uuid do |t|
      t.belongs_to :user, index: true
      t.monetize :amount

      t.timestamps
    end
  end
end
