class RemovePriceFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :price
  end

  def down
    add_column :products, :price, :float
  end
end
