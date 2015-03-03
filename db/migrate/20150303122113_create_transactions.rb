class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :transaction_type
      t.references :sender, index: true
      t.references :receiver, index: true
      t.integer :amount
      t.string :reference
      t.string :status
      t.string :communication

      t.timestamps null: false
    end
    # add_foreign_key :transactions, :senders
    # add_foreign_key :transactions, :receivers
  end
end
