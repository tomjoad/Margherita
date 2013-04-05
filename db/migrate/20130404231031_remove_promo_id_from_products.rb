class RemovePromoIdFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :promo_id
  end

  def down
    add_columnt :products, :promo_id
  end
end
