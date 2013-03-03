class AddDeliveryToOrdersRemoveDeliveryCost < ActiveRecord::Migration

  change_table :orders do |t|
    t.remove :delivery_cost
    t.boolean :delviery
  end

end
