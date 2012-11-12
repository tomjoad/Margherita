class RemovePriceForSmallFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :price_for_small
  end

  def down
    add_column :products, :price_for_small, :float
  end
end
