class RemoveVariantIdFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :variant_id
  end

  def down
    add_column :products, :varian_id, :integer
  end
end
