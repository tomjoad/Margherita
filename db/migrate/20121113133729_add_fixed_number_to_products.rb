class AddFixedNumberToProducts < ActiveRecord::Migration
  def change
    add_column :products, :fixed_number, :integer
  end
end
