class AddDetailsForShopOwnerUsers < ActiveRecord::Migration
  def change
    add_column :users, :shopname, :string
    add_column :users, :description, :text
    add_column :users, :address, :string
    add_column :users, :website, :string
    add_column :users, :facebook, :string
    add_column :users, :url, :string
    add_column :users, :pin, :string
  end
end
