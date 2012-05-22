class AddAddressInfoToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :zip_code, :string
    add_column :orders, :city, :string
    add_column :orders, :home_number, :string
    add_column :orders, :street, :string
    add_column :orders, :phone, :string
  end
end
