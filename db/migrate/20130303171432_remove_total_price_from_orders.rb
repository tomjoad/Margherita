class RemoveTotalPriceFromOrders < ActiveRecord::Migration
  change_table :orders do |t|
    t.remove :total_price
   end
end
