class CreateTopups < ActiveRecord::Migration
  def change
    create_table :topups do |t|
      t.integer :amount
      t.references :receiver, index: true
      t.string :reference
      t.string :status
      t.references :admin_user, index: true

      t.timestamps null: false
    end
    # add_foreign_key :topups, :receivers
    # add_foreign_key :topups, :admin_users
  end
end
