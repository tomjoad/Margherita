class AddDistanceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :distance, :string
  end
end
