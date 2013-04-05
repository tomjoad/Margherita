class RemoveTotalPriceFromOrders < ActiveRecord::Migration
  # change_table :orders do |t|
  #   t.remove :total_price
  #  end
  def up
    remove_column :orders, :total_price
  end

  def down
    add_column :orders, :total_price, :float
  end

end
