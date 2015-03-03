class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :salutation
      t.string :email
      t.string :phone_number
      t.string :user_type
      t.string :vat_number
      t.boolean :active

      t.timestamps null: false
    end
  end
end
