class RemovePromoIdFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :promo_id
  end

  def down
    add_column :products, :promo_id, :integer
  end
end
