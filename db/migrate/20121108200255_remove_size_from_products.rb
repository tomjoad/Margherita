class RemoveSizeFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :size
  end

  def down
    add_column :products, :size, :string
  end
end
