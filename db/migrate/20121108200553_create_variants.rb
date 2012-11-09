class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.float :price
      t.string :size

      t.timestamps
    end
  end
end
