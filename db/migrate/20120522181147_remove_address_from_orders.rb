class RemoveAddressFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :address
  end

  def down
    add_column :orders, :address
  end
end
