class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.float :total_price
      t.string :cart
      t.string :address
      t.string :state

      t.timestamps
    end
  end
end
