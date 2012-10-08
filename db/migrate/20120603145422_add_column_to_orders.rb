class AddColumnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :products_price, :float
  end
end
