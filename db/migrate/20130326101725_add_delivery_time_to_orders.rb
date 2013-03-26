class AddDeliveryTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :delivery_time, :time
  end
end
