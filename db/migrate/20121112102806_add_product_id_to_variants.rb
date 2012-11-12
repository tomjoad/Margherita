class AddProductIdToVariants < ActiveRecord::Migration
  def change
    add_column :variants, :product_id, :integer
  end
end
