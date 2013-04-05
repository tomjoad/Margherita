class AddDeliveryToOrdersRemoveDeliveryCost < ActiveRecord::Migration

  # change_table :orders do |t|
  #   t.remove :delivery_cost
  #   t.boolean :delivery
  # end

  def up
    remove_column :orders, :delivery_cost
    add_column :orders, :delivery, :boolean
  end

  def down
    add_column :orders, :delivery_cost, :float
    remove_column :orders, :delivery
  end
end
