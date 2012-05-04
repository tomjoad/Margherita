class AddPriceForSmallToProducts < ActiveRecord::Migration
  def change
    add_column :products, :price_for_small, :float
  end
end
