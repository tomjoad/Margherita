class RemoveVarianIdFromVariants < ActiveRecord::Migration
  def up
    remove_column :products, :varian_id
  end

  def down
    add_column :products, :varian_id, :integer
  end
end
