class AddDeliveryCostToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_cost, :float
  end
end
